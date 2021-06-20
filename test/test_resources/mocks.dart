import 'package:mockito/mockito.dart';
import 'package:prospect_app/infrastructure/facades/auth_facade.dart';
import 'package:prospect_app/infrastructure/facades/cache_facade.dart';

class MockAuthFacade extends Mock implements IAuthFacade {}

class MockCacheFacade extends Mock implements ICacheFacade {}
