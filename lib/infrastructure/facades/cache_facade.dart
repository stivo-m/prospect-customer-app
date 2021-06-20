import 'package:prospect_app/domain/entities/user_profile_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICacheFacade {
  final SharedPreferences sharedPreferences;

  ICacheFacade({
    required this.sharedPreferences,
  });

  String? getBearerToken();

  Future<bool> saveBearerToken({required String token});

  Future<bool> removeBearerToken();

  Future<bool> saveUserProfile({required UserProfile userProfile});
  Future<bool> deleteUserProfile();

  UserProfile? getUserProfile();
}
