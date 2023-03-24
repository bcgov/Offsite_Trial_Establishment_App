extension StreamExt on Stream {
  Stream<R> whereType<R>() => where((event) => event is R).cast<R>();

  Stream<R> mapWhereType<T, R>(R Function(T) toElement) => whereType<T>().map(toElement);
}
