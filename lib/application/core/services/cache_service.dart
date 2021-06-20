import 'package:prospect_app/infrastructure/facades/cache_facade.dart';

class CacheService {
  final ICacheFacade cacheRepository;

  CacheService({
    required this.cacheRepository,
  });

  String? getToken() {
    return cacheRepository.getBearerToken();
  }

  Future<bool> saveToken({required String token}) {
    return cacheRepository.saveBearerToken(token: token);
  }

  Future<bool> removeToken() {
    return cacheRepository.removeBearerToken();
  }
}
