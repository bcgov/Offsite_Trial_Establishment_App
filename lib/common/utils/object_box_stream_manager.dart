import 'dart:async';

import 'package:offsite_trial_establishment_app/common/utils/object_box_manager.dart';
import 'package:offsite_trial_establishment_app/common/utils/uuid_utils.dart';
import 'package:offsite_trial_establishment_app/objectbox.g.dart';

typedef ListStreamInitCallback<T> = Stream<List<T>> Function(Box<T>);
typedef IdsStreamInitCallback<T> = Stream<List<int>> Function(Box<T>);
typedef FirstStreamInitCallback<T> = Stream<T?> Function(Box<T>);

class _RestorableStream<T, Init> {
  final Init init;
  final StreamController<T> streamController;
  final Stream<T> mainStream;
  Stream<T> childStream;
  StreamSubscription<T>? _sub;

  _RestorableStream({
    required this.init,
    required this.streamController,
    required this.mainStream,
    required this.childStream,
  }) {
    _settingUpdate();
    streamController.onCancel = () {
      _sub?.cancel();
    };
  }

  void updateStream(Stream<T> childStream) {
    this.childStream = childStream;
    _sub?.cancel();
    _settingUpdate();
  }

  void _settingUpdate() {
    _sub = childStream.listen(streamController.add);
  }
}

class ObjectBoxStreamManager<T> {
  final Map<String, _RestorableStream<List<T>, ListStreamInitCallback<T>>> _listStream = {};
  final Map<String, _RestorableStream<List<int>, IdsStreamInitCallback<T>>> _idsStream = {};
  final Map<String, _RestorableStream<T?, FirstStreamInitCallback<T>>> _firstStream = {};
  final ObjectBoxManager _boxManager;

  ObjectBoxStreamManager(this._boxManager) {
    _boxManager.addCallback((_) => _updateStreams());
  }

  Stream<List<T>> watch(ListStreamInitCallback<T> callback) {
    var key = UuidUtils.generate();
    while (_listStream.containsKey(key)) {
      key = UuidUtils.generate();
    }
    final stream = _createListStream(callback, key);
    _listStream[key] = stream;
    return stream.mainStream;
  }

  Stream<List<int>> watchIds(IdsStreamInitCallback<T> callback) {
    var key = UuidUtils.generate();
    while (_idsStream.containsKey(key)) {
      key = UuidUtils.generate();
    }
    final stream = _createIdsStream(callback, key);
    _idsStream[key] = stream;
    return stream.mainStream;
  }

  Stream<T?> watchFirst(FirstStreamInitCallback<T> callback) {
    var key = UuidUtils.generate();
    while (_firstStream.containsKey(key)) {
      key = UuidUtils.generate();
    }
    final stream = _createFirstStream(callback, key);
    _firstStream[key] = stream;
    return stream.mainStream;
  }

  _RestorableStream<List<T>, ListStreamInitCallback<T>> _createListStream(
    ListStreamInitCallback<T> callback,
    String key,
  ) {
    final streamController = StreamController<List<T>>();
    final mainStream = _createMainStream(streamController, () => _listStream.remove(key));
    final baseStream = callback(_boxManager.store.box<T>());
    return _RestorableStream<List<T>, ListStreamInitCallback<T>>(
      init: callback,
      streamController: streamController,
      mainStream: mainStream,
      childStream: baseStream.asBroadcastStream(),
    );
  }

  _RestorableStream<List<int>, IdsStreamInitCallback<T>> _createIdsStream(
    IdsStreamInitCallback<T> callback,
    String key,
  ) {
    final streamController = StreamController<List<int>>();
    final mainStream = _createMainStream(streamController, () => _listStream.remove(key));
    final baseStream = callback(_boxManager.store.box<T>());
    return _RestorableStream<List<int>, IdsStreamInitCallback<T>>(
      init: callback,
      streamController: streamController,
      mainStream: mainStream,
      childStream: baseStream.asBroadcastStream(),
    );
  }

  _RestorableStream<T?, FirstStreamInitCallback<T>> _createFirstStream(
    FirstStreamInitCallback<T> callback,
    String key,
  ) {
    final streamController = StreamController<T?>();
    final mainStream = _createMainStream(streamController, () => _firstStream.remove(key));
    final baseStream = callback(_boxManager.store.box<T>());
    return _RestorableStream<T?, FirstStreamInitCallback<T>>(
      init: callback,
      streamController: streamController,
      mainStream: mainStream,
      childStream: baseStream.asBroadcastStream(),
    );
  }

  Stream<E> _createMainStream<E>(StreamController<E> controller, Function() onClose) {
    var countSubs = 0;
    return controller.stream.asBroadcastStream(onListen: (_) {
      countSubs++;
    }, onCancel: (_) {
      countSubs--;
      if (countSubs <= 0) {
        controller.close();
        onClose();
      }
    });
  }

  void _updateStreams() {
    for (final stream in _listStream.values) {
      stream.updateStream(stream.init(_boxManager.store.box<T>()));
    }
    for (final stream in _firstStream.values) {
      stream.updateStream(stream.init(_boxManager.store.box<T>()));
    }
  }
}
