import 'dart:async';

class StreamWrapper<T> {
  final _controller = StreamController<T>();
  late final _stream = _controller.stream.asBroadcastStream();
  T _value;

  StreamWrapper(this._value);

  T get value => _value;

  Stream<T> get stream {
    _controller.add(_value);
    return _stream;
  }

  set value(T newValue) {
    _value = newValue;
    _controller.add(_value);
  }
}
