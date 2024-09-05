import 'package:selene/src/structs/block.dart';
import 'package:selene/src/structs/sync_committee.dart';

class LightClientHeader {
  final BeaconBlockHeader beacon;
  final ExecutionPayloadHeader? execution;
  final ExecutionBranch? executionBranch;

  LightClientHeader(
      {required this.beacon, this.execution, this.executionBranch});

  static fromJson(response) {
    return LightClientHeader(
        beacon: BeaconBlockHeader.fromJson(response['beacon']),
        execution: ExecutionPayloadHeader.fromJson(response['execution']),
        executionBranch:
            ExecutionBranch.fromJson(response['execution_branch']));
  }
}

class LightClientBootstrap {
  final LightClientHeader header;
  final SyncCommittee currentSyncCommittee;
  final SyncCommitteeBranch currentSyncCommitteeBranch;

  LightClientBootstrap(
      {required this.header,
      required this.currentSyncCommittee,
      required this.currentSyncCommitteeBranch});

  static fromJson(response) {
    return LightClientBootstrap(
        header: LightClientHeader.fromJson(response['data']['header']),
        currentSyncCommittee:
            SyncCommittee.fromJson(response['data']['current_sync_committee']),
        currentSyncCommitteeBranch: SyncCommitteeBranch.fromJson(
            response['data']['current_sync_committee_branch']));
  }
}

class LightClientUpdate {
  final LightClientHeader attestedHeader;
  final SyncCommittee nextSyncCommittee;
  final SyncCommitteeBranch nextSyncCommitteeBranch;
  final LightClientHeader? finalizedHeader;
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

class LightClientFinalityUpdate {
  final LightClientHeader attestedHeader;
  final LightClientHeader finalizedHeader;
  final FinalityBranch finalityBranch;
  final SyncAggregate syncAggregate;
  final int signatureSlot;

  LightClientFinalityUpdate(
      {required this.attestedHeader,
      required this.finalizedHeader,
      required this.finalityBranch,
      required this.syncAggregate,
      required this.signatureSlot});
}

class LightClientOptimisticUpdate {
  final LightClientHeader attestedHeader;
  final SyncAggregate syncAggregate;
  final int signatureSlot;

  LightClientOptimisticUpdate(
      {required this.attestedHeader,
      required this.syncAggregate,
      required this.signatureSlot});
}

class LightClientStore {
  final LightClientHeader finalizedHeader;
  final SyncCommittee currentSyncCommittee;
  final SyncCommittee? nextSyncCommittee;
  final LightClientUpdate? bestValidUpdate;
  final LightClientHeader optimisticHeader;
  final int previousMaxActiveParticipants;
  final int currentMaxActiveParticipants;

  LightClientStore(
      {required this.finalizedHeader,
      required this.currentSyncCommittee,
      this.nextSyncCommittee,
      this.bestValidUpdate,
      required this.optimisticHeader,
      required this.previousMaxActiveParticipants,
      required this.currentMaxActiveParticipants});
}
