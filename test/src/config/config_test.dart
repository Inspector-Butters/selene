import 'package:selene/src/config/configs.dart';
import 'package:test/test.dart';

void main() {
  group('Configs Tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    testCanWriteAndRead();
  });
}

void testCanWriteAndRead() {
  test('Write and Read', () {
    Configs.setRPC_URL("rpc url 1");
    Configs.setThirdPartyRPC_URL("rpc url 2");
    Configs.setThirdPartyAPI_KEY("api key 1");

    expect(Configs.RPC_URL, "rpc url 1");
    expect(Configs.thirdPartyRPC_URL, "rpc url 2");
    expect(Configs.thirdPartyAPI_KEY, "api key 1");
  });
}
