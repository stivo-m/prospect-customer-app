import 'dart:convert';

import 'package:prospect_app/domain/core/app_strings.dart';
import 'package:prospect_app/domain/entities/user_profile_entity.dart';
import 'package:prospect_app/infrastructure/facades/cache_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheRepository extends ICacheFacade {
  @override
  String? getBearerToken() {
    SharedPreferences.getInstance().then(
      (sharedPreferences) => () {
        return sharedPreferences.getString(BEARER_TOKEN_KEY);
      },
    );
  }

  @override
  Future<bool> saveBearerToken({required String token}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(BEARER_TOKEN_KEY, token);
  }

  @override
  Future<bool> removeBearerToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(BEARER_TOKEN_KEY);
  }

  @override
  Future<UserProfile?> getUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userProfile = sharedPreferences.getString(USER_PROFILE_KEY);
    if (userProfile != null) {
      return UserProfile.fromJson(
        jsonDecode(userProfile),
      );
    }
  }

  @override
  Future<bool> saveUserProfile({required UserProfile userProfile}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
      USER_PROFILE_KEY,
      jsonEncode(userProfile.toJson()),
    );
  }

  @override
  Future<bool> deleteUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(USER_PROFILE_KEY);
  }
}
