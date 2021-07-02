import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:prospect_app/domain/core/failures.dart';
import 'package:prospect_app/domain/core/validators.dart';

class PhoneNumber {
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumber.withValue({required String input}) {
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber._(this.value);

  Map<String, dynamic> toMap() {
    return {
      'value': value.getOrElse(() => '').toString(),
    };
  }

  factory PhoneNumber.fromMap(Map<String, dynamic> map) {
    return PhoneNumber.withValue(input: map['value']);
  }

  String toJson() => json.encode(toMap());

  factory PhoneNumber.fromJson(String source) =>
      PhoneNumber.fromMap(json.decode(source));
}
