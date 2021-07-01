import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prospect_app/domain/core/app_strings.dart';
import 'package:prospect_app/domain/entities/user_profile_entity.dart';
import 'package:prospect_app/domain/objects/phone_number_value_object.dart';
import 'package:prospect_app/domain/objects/name_value_object.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/facades/auth_facade.dart';
import 'package:prospect_app/infrastructure/repository/cache_repository.dart';
import 'package:http/http.dart' as http;

class AuthRepository extends IAuthFacade {
  final ConnectivityResult connectivityResult;
  final CacheRepository _cacheRepository = CacheRepository();

  AuthRepository({required this.connectivityResult})
      : super(connectivityResult: connectivityResult);

  var headers = {
    'Content-Type': 'application/json',
  };

  @override
  Future logOut() async {
    if (connectivityResult == ConnectivityResult.none) {
      // return local data source
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // return remote data source
    }
  }

  @override
  Future<Either<String, String>> loginUser({
    required EmailAddress emailAddress,
    required String password,
  }) async {
    if (connectivityResult == ConnectivityResult.none) {
      // return local data source
      String? _token = await _cacheRepository.getBearerToken();
      if (_token != null || _token != '') {
        return right(_token!);
      } else {
        return left('Authentication failed. No internet connection');
      }
    } else {
      // return remote data source
      try {
        http.Response response = await http.post(
          Uri.parse(BASE_URL + 'auth'),
          body: {
            'email': emailAddress.value.getOrElse(() => ''),
            'password': password,
            'role': 'customer'
          },
        );

        String _token = await _populateUserFields(response);
        print(_token);
        // return a value of right
        return right(_token);
      } on DioError catch (e) {
        return left(e.response!.data['text']);
      } catch (e) {
        return left(e.toString());
      }
    }
  }

  @override
  Future profile() {
    if (connectivityResult == ConnectivityResult.none) {
      // return local data source
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // return remote data source
    }
    throw UnimplementedError();
  }

  @override
  Future registerUser(
      {required FullName fullName,
      required EmailAddress emailAddress,
      required String password,
      required PhoneNumber phoneNumber,
      String? role}) async {
    if (connectivityResult == ConnectivityResult.none) {
      // return local data source
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // return remote data
      try {
        http.Response response = await http.post(
          Uri.parse(BASE_URL + '/auth'),
          body: {
            'name': fullName.value.getOrElse(() => ''),
            'email': emailAddress.value.getOrElse(() => ''),
            'password': password,
            'phone_number': phoneNumber.value.getOrElse(() => ''),
          },
        );

        String _token = await _populateUserFields(response);
        // return a value of right
        return right(_token);
      } catch (e) {
        return left(e.toString());
      }
    }
    throw UnimplementedError();
  }

  Future<String> _populateUserFields(http.Response response) async {
    Map<String, dynamic> body = json.decode(response.body);

    String _token = body['token'];
    // save token to cache
    await _cacheRepository.saveBearerToken(token: _token);
    // save user profile on cache
    UserProfile _userProfile = UserProfile(
      emailAddress: EmailAddress.withValue(input: body['user']['email']),
      fullName: FullName.withValue(input: body['user']['email']),
      phoneNumber: PhoneNumber.withValue(input: '0'),
      role: body['user']['role'],
    );

    await _cacheRepository.saveUserProfile(
      userProfile: _userProfile,
    );
    return _token;
  }
}
