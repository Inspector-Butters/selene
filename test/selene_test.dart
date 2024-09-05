import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    // final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    // testIsAwesome(awesome);
  });
}

void testIsAwesome(awesome) {
  test('First Test', () {
    expect(awesome.isAwesome, isTrue);
  });
}
