import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prospect_app/domain/objects/phone_number_value_object.dart';

void main() {
  group('PhoneNumberValueObject test', () {
    final String validPhoneNumber = '254712300300';
    final String invalidPhoneNumber = '2547123oo300';

    test('should return right if valid phone number is passed', () {
      PhoneNumber phoneNumber = PhoneNumber.withValue(input: validPhoneNumber);

      expect(phoneNumber.value, isA<Right>());
      expect(phoneNumber.value.getOrElse(() => ''), validPhoneNumber);
    });
    test('should return left if invalid phone number is passed', () {
      PhoneNumber phoneNumber =
          PhoneNumber.withValue(input: invalidPhoneNumber);

      expect(phoneNumber.value, isA<Left>());
    });
  });
}
