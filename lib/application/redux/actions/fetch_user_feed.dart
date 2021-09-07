import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';

class FetchuserFeed extends ReduxAction<AppState> {
  final CacheService cacheService;

  FetchuserFeed({
    required this.cacheService,
  });
  @override
  Future<AppState?> reduce() {
    throw UnimplementedError();
  }
}
