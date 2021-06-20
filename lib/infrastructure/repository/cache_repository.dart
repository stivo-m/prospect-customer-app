import 'dart:convert';

import 'package:prospect_app/domain/core/app_strings.dart';
import 'package:prospect_app/domain/entities/user_profile_entity.dart';
import 'package:prospect_app/infrastructure/facades/cache_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheRepository extends ICacheFacade {
  final SharedPreferences sharedPreferences;
  CacheRepository({
    required this.sharedPreferences,
  }) : super(
          sharedPreferences: sharedPreferences,
        );

  @override
  String? getBearerToken() {
    return sharedPreferences.getString(BEARER_TOKEN_KEY);
  }

  @override
  Future<bool> saveBearerToken({required String token}) {
    return sharedPreferences.setString(BEARER_TOKEN_KEY, token);
  }

  @override
  Future<bool> removeBearerToken() async {
    return sharedPreferences.remove(BEARER_TOKEN_KEY);
  }

  @override
  UserProfile? getUserProfile() {
    String? userProfile = sharedPreferences.getString(USER_PROFILE_KEY);
    if (userProfile != null) {
      return UserProfile.fromJson(
        jsonDecode(userProfile),
      );
    }
  }

  @override
  Future<bool> saveUserProfile({required UserProfile userProfile}) {
    return sharedPreferences.setString(
      USER_PROFILE_KEY,
      jsonEncode(userProfile.toJson()),
    );
  }

  @override
  Future<bool> deleteUserProfile() {
    return sharedPreferences.remove(USER_PROFILE_KEY);
  }
}
