extension Iterables<E> on Iterable<E> {
  List<R> mapList<R>(R Function(E e) toElement) => map(toElement).toList();

  List<R> mapListNotNull<R>(R? Function(E e) toElement) => map(toElement).whereType<R>().toList();
}
