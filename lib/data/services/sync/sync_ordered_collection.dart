import 'dart:async';

import 'package:collection/collection.dart';

part 'sync_object.dart';
part 'sync_state.dart';

typedef SyncStateSet = Set<SyncObject>;
typedef SyncStateMap = Map<int, SyncStateSet>;
typedef _SyncStateSetCheck = bool Function(SyncStateSet);
typedef _SyncStateMapCheck = bool Function(SyncStateMap, [_SyncStateSetCheck?]);

class _WithPriority<T> {
  T object;
  int priority;

  _WithPriority(
    this.object,
    this.priority,
  );
}

class SyncOrderedCollection {
  final _values = <SyncStateMap>[];

  bool get isNotEmpty => _values.any((e) => e.values.any((e) => e.isNotEmpty));

  bool get isEmpty => _values.every((e) => e.values.every((e) => e.isEmpty));

  int get length => _count();

  int get successCount => _count((e) => e.state == SyncState.success);

  bool get isCompleted => _values.every(_mapCompleted);

  @override
  String toString() {
    return 'SyncOrderedCollection{_values: $_values}';
  }

  SyncStateSet getNext() {
    return _getSetWithPriority(_setCompleted)?.object ?? {};
  }

  SyncStateSet? getNextFromMap(SyncStateMap map) {
    return _getFromMapWithPriority(map, _setCompleted)?.object;
  }

  bool add<T>(int priority, SyncObject object) {
    return _getSetForAdd(priority).add(object);
  }

  void addAll<T>(int priority, Iterable<SyncObject> objects) {
    if (objects.isEmpty) return;
    _getSetForAdd(priority).addAll(objects);
  }

  void clear() {
    _values.clear();
  }

  void compress() {
    final SyncStateMap singleMap = {};
    for (final map in _values) {
      for (final key in map.keys) {
        for (final SyncObject value in map[key] ?? {}) {
          if (value.state != SyncState.success) {
            value.state = SyncState.waiting;
            singleMap.putIfAbsent(key, () => {}).add(value);
          }
        }
      }
    }
    _values.clear();
    _values.add(singleMap);
  }

  SyncStateMap? _getMapWithPriority({_SyncStateMapCheck? mapSkipCheck, _SyncStateSetCheck? setSkipCheck}) {
    var index = 0;
    while (index < _values.length && (mapSkipCheck ?? _mapEvery)(_values[index], setSkipCheck)) {
      index++;
    }
    if (index >= _values.length) return null;
    while (index < _values.length && _getFromMapWithPriority(_values[index], setSkipCheck) == null) {
      index++;
    }
    if (index >= _values.length) return null;
    return _values[index];
  }

  _WithPriority<SyncStateSet>? _getSetWithPriority([_SyncStateSetCheck? skipCheck]) {
    final map = _getMapWithPriority();
    if (map == null) return null;
    return _getFromMapWithPriority(map, skipCheck);
  }

  _WithPriority<SyncStateSet>? _getFromMapWithPriority(SyncStateMap map, [_SyncStateSetCheck? skipCheck]) {
    var keyIndex = 0;
    var keys = map.keys.sorted((a, b) => a.compareTo(b)).toList();
    while (keyIndex < keys.length && (skipCheck ?? _setEnded)(map[keys[keyIndex]] ?? {})) {
      keyIndex++;
    }
    if (keyIndex >= keys.length) return null;
    return _WithPriority(map[keys[keyIndex]] ?? {}, keys[keyIndex]);
  }

  SyncStateSet _getSetForAdd(int priority) {
    final map = _getMapWithPriority(mapSkipCheck: _mapEvery, setSkipCheck: _setStarted);
    if (map == null) {
      final set = <SyncObject>{};
      _values.add({priority: set});
      return set;
    }
    final setWithPriority = _getFromMapWithPriority(map, _setStarted);
    if (setWithPriority == null || setWithPriority.priority > priority) {
      final set = <SyncObject>{};
      _values.add({priority: set});
      return set;
    }
    return map.putIfAbsent(priority, () => {});
  }

  bool _mapCompleted(SyncStateMap map) => map.values.every(_setCompleted);

  bool _setCompleted(SyncStateSet set) => set.every((e) => e.state == SyncState.success);

  bool _setEnded(SyncStateSet set) => set.every((e) => e.state == SyncState.success || e.state == SyncState.error);

  bool _setStarted(SyncStateSet set) => set.any((e) => e.state != SyncState.waiting);

  bool _mapAny(SyncStateMap map, [_SyncStateSetCheck? check]) => map.values.any(check ?? _setEnded);

  bool _mapEvery(SyncStateMap map, [_SyncStateSetCheck? check]) => map.values.every(check ?? _setEnded);

  int _count([bool Function(SyncObject)? test]) {
    return _values.fold(0, (value, e) => value + _countInMap(e, test));
  }

  int _countInMap(SyncStateMap map, [bool Function(SyncObject)? test]) {
    return map.values.fold(0, (value, e) => value + _countInSet(e, test));
  }

  int _countInSet(SyncStateSet set, [bool Function(SyncObject)? test]) {
    if (test == null) {
      return set.length;
    }
    return set.where(test).length;
  }
}
