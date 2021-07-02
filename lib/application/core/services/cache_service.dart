import 'package:prospect_app/infrastructure/repository/cache_repository.dart';

class CacheService {
  CacheService._internal() {}
  static final CacheService _singleton = CacheService._internal();
  static CacheService get instance => _singleton;

  CacheRepository _cacheRepository = CacheRepository();

  Future<String?> getToken() async {
    return await _cacheRepository.getBearerToken();
  }

  Future<bool> saveToken({required String token}) {
    return _cacheRepository.saveBearerToken(token: token);
  }

  Future<bool> removeToken() {
    return _cacheRepository.removeBearerToken();
  }
}
