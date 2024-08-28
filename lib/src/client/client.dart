import '../config/configs.dart';

class Selene {
  final String rpcUrl;
  final String thirdPartyRpcUrl;

  Selene({required this.rpcUrl, required this.thirdPartyRpcUrl}) {
    Configs.setRPC_URL(rpcUrl);
    Configs.setThirdPartyRPC_URL(thirdPartyRpcUrl);
  }

  void sync(String? s) async {
    if (s == null) {
      throw Exception('Block hash cannot be empty');
    }
  }
}

void main() {
  var rpcUrl = "http://testing.holesky.beacon-api.nimbus.team/";
  var thirdPartyRpcUrl = "https://ethereum-holesky-rpc.publicnode.com/";

  var selene = Selene(rpcUrl: rpcUrl, thirdPartyRpcUrl: thirdPartyRpcUrl);

  selene.sync(
      "0xb5c272a8aa926eeb8241ff5f32fd337720ddcfc4eacfa08ef66a6bd4185ca058");
}
