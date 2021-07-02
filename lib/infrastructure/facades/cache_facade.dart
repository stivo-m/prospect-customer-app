import 'package:prospect_app/domain/entities/user_profile_entity.dart';

abstract class ICacheFacade {
  String? getBearerToken();

  Future<bool> saveBearerToken({required String token});

  Future<bool> removeBearerToken();

  Future<bool> saveUserProfile({required UserProfile userProfile});
  Future<bool> deleteUserProfile();

  Future<UserProfile?> getUserProfile();
}
