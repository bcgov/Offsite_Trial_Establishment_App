import 'dart:async';
import 'dart:io';

import 'package:offsite_trial_establishment_app/domain/models/errors.dart';
import 'package:postgres/postgres.dart';

const _defaultCloseDelay = Duration(seconds: 5);

enum _ConnectionState {
  created,
  opened,
  closed,
}

class PostgresManager {
  final String host;
  final int port;
  final String database;
  final String username;
  final String password;
  final Duration closeDelay;

  late PostgreSQLConnection _connection;
  _ConnectionState _state = _ConnectionState.created;
  var _countOfTask = 0;
  var _countOfCompletedTask = 0;
  Timer? _closeTimer;
  Completer? _openCompleter;

  PostgresManager({
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
    this.closeDelay = _defaultCloseDelay,
  }) {
    _createConnection();
  }

  Future<PostgreSQLResult> query(
    String fmtString, {
    Map<String, dynamic>? substitutionValues,
    bool? allowReuse,
    int? timeoutInSeconds,
    bool? useSimpleQueryProtocol,
  }) async {
    return _runTask(
      () async => await _connection.query(
        fmtString,
        substitutionValues: substitutionValues,
        allowReuse: allowReuse,
        timeoutInSeconds: timeoutInSeconds,
        useSimpleQueryProtocol: useSimpleQueryProtocol,
      ),
    );
  }

  Future<List<Map<String, Map<String, dynamic>>>> mappedResultsQuery(
    String fmtString, {
    Map<String, dynamic>? substitutionValues = const {},
    bool? allowReuse,
    int? timeoutInSeconds,
  }) async {
    return _runTask(
      () async => await _connection.mappedResultsQuery(
        fmtString,
        substitutionValues: substitutionValues,
        allowReuse: allowReuse,
        timeoutInSeconds: timeoutInSeconds,
      ),
    );
  }

  Future transaction(
    Future Function(PostgreSQLExecutionContext connection) queryBlock, {
    int? commitTimeoutInSeconds,
  }) async {
    return _runTask(
      () async => await _connection.transaction(
        queryBlock,
        commitTimeoutInSeconds: commitTimeoutInSeconds,
      ),
    );
  }

  Future<T> _runTask<T>(Future<T> Function() task) async {
    _registerNewTask();
    try {
      await _openIfNeed();
      return await task();
    } catch (e) {
      if (e is SocketException || e is TimeoutException) {
        throw ConnectionException();
      }
      rethrow;
    } finally {
      _registerCompletedTask();
    }
  }

  Future<void> _openIfNeed() async {
    if (_connection.isClosed) {
      _state = _ConnectionState.closed;
    }
    if (_state == _ConnectionState.opened) return await _openCompleter?.future;
    if (_state == _ConnectionState.closed) _createConnection();
    _state = _ConnectionState.opened;
    _openCompleter = Completer();
    try {
      await _connection.open();
      if (_openCompleter?.isCompleted == false) _openCompleter?.complete();
    } catch (error, stack) {
      if (_openCompleter?.isCompleted == false) _openCompleter?.completeError(error, stack);
      await _closeConnection();
      rethrow;
    } finally {
      _openCompleter = null;
    }
  }

  Future<void> _closeConnection() async {
    _state = _ConnectionState.closed;
    await _connection.close();
  }

  void _createConnection() {
    _connection = PostgreSQLConnection(
      host,
      port,
      database,
      password: password,
      username: username,
    );
    _state = _ConnectionState.created;
  }

  void _registerNewTask() {
    _closeTimer?.cancel();
    _countOfTask++;
  }

  void _registerCompletedTask() {
    _countOfCompletedTask++;
    if (_countOfCompletedTask < _countOfTask) return;
    _closeTimer?.cancel();
    if (_state == _ConnectionState.opened) {
      _closeTimer = Timer(closeDelay, () {
        _countOfTask = 0;
        _countOfCompletedTask = 0;
        _closeConnection();
      });
    }
  }
}
