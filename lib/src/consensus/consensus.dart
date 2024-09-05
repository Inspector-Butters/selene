import 'package:selene/src/config/configs.dart';
import 'package:selene/src/consensus/api/sync_api.dart';
import 'package:selene/src/kv/kv.dart';
import 'package:selene/src/structs/update.dart';

import 'helpers.dart';

class ConsensusEngine {
  static bool isSynced() {
    throw UnimplementedError();
  }

  static void startSync(String rpc, String? checkpoint) async {
    var db = getDB();
    if (db.isEmpty()) {
      if (checkpoint == null) {
        throw Exception('Block hash cannot be empty');
      }
      db.set('checkpoint', checkpoint);
      var bootstrap = await SyncAPIs.lightClientBootstrap(checkpoint);
      LightClientStore store =
          _initializeLightClientStore(checkpoint, bootstrap);

      print(store.currentSyncCommittee.aggregatePubkey);
    }
  }

  static LightClientStore _initializeLightClientStore(
      String checkpoint, LightClientBootstrap bootstrap) {
    if (!_isValidLightClientHeader(bootstrap.header)) {
      throw Exception('Invalid light client header');
    }
    if (bootstrap.header.beacon.hashTreeRoot() != checkpoint) {
      throw Exception('Checkpoint does not match the header');
    }
    if (!isValidMerkleBranch(
        leaf: bootstrap.currentSyncCommittee.hashTreeRoot(),
        branch: bootstrap.currentSyncCommitteeBranch.branch,
        depth: floorLog2(Configs.currentSyncCommitteeGIndex),
        index: getSubtreeIndex(Configs.currentSyncCommitteeGIndex),
        root: bootstrap.header.beacon.stateRoot)) {
      throw Exception('Invalid sync committee');
    }
    return LightClientStore(
        finalizedHeader: bootstrap.header,
        currentSyncCommittee: bootstrap.currentSyncCommittee,
        optimisticHeader: bootstrap.header,
        previousMaxActiveParticipants: 0,
        currentMaxActiveParticipants: 0);
  }

  static bool _isValidLightClientHeader(LightClientHeader header) {
    int epoch = computeEpochAtSlot(header.beacon.slot);

    if (epoch < Configs.denebForkEpoch) {
      if (header.execution?.blobGasUsed != 0 ||
          header.execution?.excessBlobGas != 0) {
        return false;
      }
    }

    if (epoch < Configs.capellaForkEpoch) {
      return (header.execution == null && header.executionBranch == null);
    }

    return isValidMerkleBranch(
      leaf: getLcExecutionRoot(header),
      branch: header.executionBranch!.branch,
      depth: floorLog2(Configs.executionPayloadGIndex),
      index: getSubtreeIndex(Configs.executionPayloadGIndex),
      root: header.beacon.bodyRoot,
    );
  }
}
