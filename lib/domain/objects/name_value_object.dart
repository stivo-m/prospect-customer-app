import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:prospect_app/domain/core/failures.dart';
import 'package:prospect_app/domain/core/validators.dart';

class FullName {
  final Either<ValueFailure<String>, String> value;

  factory FullName.withValue({required String input}) {
    return FullName._(
      validateFullName(input),
    );
  }

  const FullName._(this.value);

  Map<String, dynamic> toMap() {
    return {'value': value.getOrElse(() => '').toString()};
  }

  factory FullName.fromMap(Map<String, dynamic> map) {
    return FullName.withValue(input: map['value']);
  }

  String toJson() => json.encode(toMap());

  factory FullName.fromJson(String source) =>
      FullName.fromMap(json.decode(source));
}
