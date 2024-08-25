import 'package:selene/src/kv/kv.dart';
import 'package:test/test.dart';

void main() {
  group('KV Tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    testCanWriteAndRead();
  });
}

void testCanWriteAndRead() {
  test('Write and Read', () {
    final db = getDB();
    db.set('key', 'value12');
    expect(db.get('key'), 'value12');
  });
}
