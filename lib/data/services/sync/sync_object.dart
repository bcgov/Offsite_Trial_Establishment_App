part of 'sync_ordered_collection.dart';

typedef SyncProcess = Future<void> Function(int id);

const planterPriority = 1;
const trialPriority = 2;
const plantingPriority = 3;

class SyncObject {
  final int id;
  SyncState state;
  final SyncProcess process;

  SyncObject({
    required this.id,
    required this.process,
    this.state = SyncState.waiting,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SyncObject && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '_SyncObject{id: $id, state: $state}';
  }
}
