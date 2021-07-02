import 'package:prospect_app/domain/entities/user_profile_entity.dart';
import 'package:prospect_app/infrastructure/repository/cache_repository.dart';

class CacheService {
  CacheService._internal();
  static final CacheService _singleton = CacheService._internal();
  static CacheService get instance => _singleton;

  CacheRepository _cacheRepository = CacheRepository();

  String? getToken() {
    return _cacheRepository.getBearerToken();
  }

  Future<bool> saveToken({required String token}) {
    return _cacheRepository.saveBearerToken(token: token);
  }

  Future<bool> removeToken() {
    return _cacheRepository.removeBearerToken();
  }

  Future<UserProfile?> getUserProfile() {
    return _cacheRepository.getUserProfile();
  }
}
