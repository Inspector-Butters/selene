import 'package:selene/src/config/configs.dart';
import 'package:selene/src/consensus/api/sync_api.dart';
import 'package:selene/src/kv/kv.dart';
import 'package:selene/src/structs/update.dart';

import 'helpers.dart';

class ConsensusEngine {
  static bool isSynced() {
    throw UnimplementedError();
  }

  static void startSync(String rpc, String? checkpoint) {
    var db = getDB();
    if (db.isEmpty()) {
      if (checkpoint == null) {
        throw Exception('Block hash cannot be empty');
      }
      db.set('checkpoint', checkpoint);
      var checkpointFinalizedBlockBootstrap =
          SyncAPIs.lightClientBootstrap(checkpoint);
      var checkpointPeriod =
          checkpointFinalizedBlockBootstrap.header.beacon.slot;
    }
  }

  static LightClientStore _initializeLightClientStore(
      String checkpoint, LightClientBootstrap bootstrap) {
    assert(!_isValidLightClientHeader(bootstrap.header));
    assert(bootstrap.header.beacon.hashTreeRoot() != checkpoint);
    assert(isValidMerkleBranch(
        leaf: bootstrap.currentSyncCommittee.hashTreeRoot(),
        branch: bootstrap.currentSyncCommitteeBranch,
        depth: floorLog2(Configs.currentSyncCommitteeGIndex),
        index: getSubtreeIndex(Configs.currentSyncCommitteeGIndex),
        root: bootstrap.header.beacon.stateRoot));

    return LightClientStore(
        finalizedHeader: bootstrap.header,
        currentSyncCommittee: bootstrap.currentSyncCommittee,
        optimisticHeader: bootstrap.header,
        previousMaxActiveParticipants: 0,
        currentMaxActiveParticipants: 0);
  }

  static bool _isValidLightClientHeader(LightClientHeader header) {
    throw UnimplementedError();
  }
}
