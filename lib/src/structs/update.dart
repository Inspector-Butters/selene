import 'package:selene/src/structs/block.dart';
import 'package:selene/src/structs/sync_committee.dart';

class LightClientHeader {
  final BeaconBlockHeader beacon;
  final ExecutionPayloadHeader execution;
  final ExecutionBranch executionBranch;

  LightClientHeader(
      {required this.beacon,
      required this.execution,
      required this.executionBranch});
}

class LightClientUpdate {
  final LightClientHeader attestedHeader;
  final SyncCommittee nextSyncCommittee;
  final SyncCommitteeBranch nextSyncCommitteeBranch;
  final BeaconBlockHeader? finalizedHeader;
  final FinalityBranch? finalityBranch;
  final SyncAggregate syncAggregate;
  final int signatureSlot;

  LightClientUpdate(
      {required this.attestedHeader,
      required this.nextSyncCommittee,
      required this.nextSyncCommitteeBranch,
      this.finalizedHeader,
      this.finalityBranch,
      required this.syncAggregate,
      required this.signatureSlot});
}
