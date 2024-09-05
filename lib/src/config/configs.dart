import 'dart:convert';
import 'dart:io';

class Configs {
  static final String _filePath = "lib/src/config/configs.json";
  static final int slotsPerEpoch = 32;
  static final int epochsPerSyncCommitteePeriod = 256;
  static final int slotsPerSyncCommitteePeriod =
      slotsPerEpoch * epochsPerSyncCommitteePeriod;
  static final int updateTimeout = slotsPerSyncCommitteePeriod;
  static final int minSyncCommitteeParticipants = 1;

  static final int executionPayloadGIndex = 25;
  static final int currentSyncCommitteeGIndex = 54;
  static final int nextSyncCommitteeGIndex = 55;
  static final int finalizedRootGIndex = 105;

  static String _RPC_URL = "";
  static String _thirdPartyRPC_URL = "";
  static String? _thirdPartyAPI_KEY = "";

  static num denebForkEpoch = 269568;
  static num capellaForkEpoch = 194048;
  static num altairForkEpoch = 74240;

  static void _load() {
    final file = File(_filePath);
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      final config = jsonDecode(contents) as Map<String, dynamic>;
      _RPC_URL = config['RPC_URL'];
      _thirdPartyRPC_URL = config['thirdPartyRPC_URL'];
      _thirdPartyAPI_KEY = config['thirdPartyAPI_KEY'];
    }
  }

  static void _save() {
    final file = File(_filePath);
    file.writeAsStringSync(jsonEncode({
      'RPC_URL': _RPC_URL,
      'thirdPartyRPC_URL': _thirdPartyRPC_URL,
      'thirdPartyAPI_KEY': _thirdPartyAPI_KEY,
    }));
  }

  static void setRPC_URL(String url) {
    _RPC_URL = url;
    _save();
  }

  static void setThirdPartyRPC_URL(String url) {
    _thirdPartyRPC_URL = url;
    _save();
  }

  static void setThirdPartyAPI_KEY(String? key) {
    _thirdPartyAPI_KEY = key;
    _save();
  }

  static String get RPC_URL {
    _load();
    return _RPC_URL;
  }

  static String get thirdPartyRPC_URL {
    _load();
    return _thirdPartyRPC_URL;
  }

  static String? get thirdPartyAPI_KEY {
    _load();
    return _thirdPartyAPI_KEY;
  }
}
