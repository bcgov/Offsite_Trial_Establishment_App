import 'package:offsite_trial_establishment_app/objectbox.g.dart';

typedef BoxInitCallback = void Function(Store);

class ObjectBoxManager {
  final String directory;
  final List<BoxInitCallback> _callbacks = [];

  Store _store;

  Store get store => _store;

  ObjectBoxManager({
    required this.directory,
  }) : _store = Store.isOpen(directory)
            ? Store.attach(
                getObjectBoxModel(),
                directory,
              )
            : Store(
                getObjectBoxModel(),
                directory: directory,
              );

  bool isOpened() => !_store.isClosed();

  bool isClosed() => _store.isClosed();

  void close() {
    _store.close();
  }

  void reopen() {
    close();
    _open();
  }

  void addCallback(BoxInitCallback boxInitCallback) {
    if (_store.isClosed()) _open();
    boxInitCallback(_store);
    _callbacks.add(boxInitCallback);
  }

  void removeCallback(BoxInitCallback boxInitCallback) {
    _callbacks.remove(boxInitCallback);
  }

  void _open() {
    _store = Store(
      getObjectBoxModel(),
      directory: directory,
    );
    for (final callback in _callbacks) {
      callback(_store);
    }
  }
}
