import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';

void main() {
  group('EmailValueObject test', () {
    final String testEmail = 'test@email.com';
    final String testInvalidEmail = 'test_email.com';
    test('should return right if email is valid', () {
      final EmailAddress emailAddress =
          EmailAddress.withValue(input: testEmail);

      expect(emailAddress.value, isA<Right>());
    });

    test('should return left if email is invalid', () {
      final EmailAddress emailAddress =
          EmailAddress.withValue(input: testInvalidEmail);

      expect(emailAddress.value, isA<Left>());
    });
    test('should convert value to Map', () {
      final EmailAddress emailAddress =
          EmailAddress.withValue(input: testEmail);

      final Map<String, dynamic> val = emailAddress.toMap();

      expect(val, isA<Map>());
      expect(val.entries.first.value, testEmail);
    });
    test('should convert value to Json', () {
      final EmailAddress emailAddress =
          EmailAddress.withValue(input: testEmail);

      final String val = emailAddress.toJson();
      final Map<String, dynamic> expectedMap = {
        'email': testEmail,
      };

      expect(val, isA<String>());
      expect(val, jsonEncode(expectedMap));
    });
    test('should convert value from Map', () {
      final Map<String, dynamic> emailMap = {
        'email': testEmail,
      };

      final EmailAddress emailAddress = EmailAddress.fromMap(emailMap);

      expect(emailAddress, isA<EmailAddress>());
      expect(emailAddress.value, isA<Right>());
      expect(emailAddress.value.getOrElse(() => ''), testEmail);
    });
  });
}
