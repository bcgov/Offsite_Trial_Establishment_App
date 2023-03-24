import 'dart:async';

import 'package:objectbox/internal.dart';
import 'package:objectbox/objectbox.dart';

extension BoxExt<T> on Box<T> {
  Query<T> buildQuery<_>([
    Condition<T>? qc,
    QueryProperty<T, _>? order,
    int flags = 0,
  ]) {
    final q = query(qc);
    if (order != null) {
      q.order(order, flags: flags);
    }
    return q.build();
  }

  Stream<List<T>> watchQuery<_>([
    Condition<T>? qc,
    QueryProperty<T, _>? order,
    int flags = 0,
    bool triggerImmediately = true,
  ]) =>
      _watchQuery(qc, order, flags).query();

  Stream<List<int>> watchIdsQuery<_>([
    Condition<T>? qc,
    QueryProperty<T, _>? order,
    int flags = 0,
    bool triggerImmediately = true,
  ]) =>
      _watchQuery(qc, order, flags).queryIds();

  Stream<T?> watchFirstQuery<_>([
    Condition<T>? qc,
    QueryProperty<T, _>? order,
    int flags = 0,
    bool triggerImmediately = true,
  ]) =>
      _watchQuery(qc, order, flags).queryFirst();

  Stream<Query<T>> _watchQuery<_>([
    Condition<T>? qc,
    QueryProperty<T, _>? order,
    int flags = 0,
    bool triggerImmediately = true,
  ]) {
    final q = query(qc);
    if (order != null) {
      q.order(order, flags: flags);
    }
    return q.watch(triggerImmediately: triggerImmediately);
  }
}

extension MapQuery<T, R> on Query<T> {
  Future<List<R>> queryMap<R>(R Function(T e) toElement) => stream().map(toElement).toList();

  Future<R> mapFirst<R>(R Function(T? e) toElement) async => toElement(findFirst());
}

extension QueryFind<T> on Query<T> {
  Future<List<T>> findAll() => stream().toList();
}

extension StreamMapQuery<T, R> on Stream<Query<T>> {
  Stream<List<T>> query() => map((query) => query.find());

  Stream<List<int>> queryIds() => map((query) => query.findIds());

  Stream<T?> queryFirst() => map((query) => query.findFirst());

  Stream<List<R>> queryMap<R>(R Function(T e) toElement) => map((query) => query.find().map(toElement).toList());

  Stream<R> mapFirst<R>(R Function(T? e) toElement) => map((query) => toElement(query.findFirst()));
}

extension StreamMap<T, R> on Stream<List<T>> {
  Stream<List<R>> queryMap<R>(R Function(T e) toElement) => map((query) => query.map(toElement).toList());

  Stream<R?> mapFirst<R>(R? Function(T? e) toElement) =>
      map((query) => query.isNotEmpty ? toElement(query.first) : null);
}

extension ToManyExt<E> on ToMany<E> {
  List<R> mapList<R>(R Function(E e) toElement) => map(toElement).toList();
}
