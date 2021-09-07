import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prospect_app/domain/objects/name_value_object.dart';

void main() {
  group('NameValueObject test', () {
    test('should return valid full name if string is passed', () {
      final String testName = 'Test Name';
      FullName fullName = FullName.withValue(input: testName);

      expect(fullName.value, isA<Right>());
      expect(fullName.value.getOrElse(() => ''), testName);
    });
    test('should return error (Left) if name is empty', () {
      final String testName = '';
      FullName fullName = FullName.withValue(input: testName);

      fullName.value.fold(
        (l) => expect(l.failedValue, testName),
        (r) => expect(r.isEmpty, equals(true)),
      );

      expect(fullName.value, isA<Left>());
    });
  });
}
