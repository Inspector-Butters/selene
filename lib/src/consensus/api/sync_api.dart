import 'package:requests/requests.dart';
import 'package:selene/src/config/configs.dart';
import 'package:selene/src/structs/update.dart';

/// SyncAPIs class contains all the APIs related to getting the updates using the sync protocol.
class SyncAPIs {
  static final String lcPath = "eth/v1/beacon/light_client/";

  /// Get the light client bootstrap.
  static dynamic lightClientBootstrap(String blockHash) async {
    if (blockHash.isEmpty) {
      throw Exception('Block hash cannot be empty');
    }
    // send request to the server to get the light client bootstrap
    var response =
        await _getRequest("${Configs.RPC_URL}${lcPath}bootstrap/$blockHash");

    LightClientBootstrap bootstrap = LightClientBootstrap.fromJson(response);
    return bootstrap;
  }

  static _getRequest(String url) async {
    var response = await Requests.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to get the light client bootstrap');
    }
    return response.json();
  }
}
