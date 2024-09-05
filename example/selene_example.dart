import 'package:selene/src/consensus/consensus.dart';
import 'package:selene/src/kv/kv.dart';

void main() {
  var db = getDB();
  db.clear();
  print("start");
  ConsensusEngine.startSync("http://unstable.holesky.beacon-api.nimbus.team/",
      "0x8fff4f260da74054fb9415c5be2881f2c99ad3947d9dee7ab9ffc79fd347ac05");
  print("end");
}
