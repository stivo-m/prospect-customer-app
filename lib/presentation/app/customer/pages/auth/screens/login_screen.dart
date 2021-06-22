import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';
import 'package:prospect_app/application/redux/actions/login_action.dart';
import 'package:prospect_app/domain/core/app_strings.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/repository/cache_repository.dart';
import 'package:prospect_app/presentation/app/customer/pages/auth/widgets/primary_button.dart';
import 'package:prospect_app/presentation/app/customer/pages/auth/widgets/primary_input_field.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: 'test@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'password');

  final StreamController _loginStreamController = StreamController.broadcast();

  void dispose() {
    _loginStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _loginStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: _loginFormKey,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        welcomeBackText,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PrimaryInputField(
                        controller: _emailController,
                        labelText: emailAddressText,
                        prefixIcon: Icon(Icons.email_outlined),
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'Email cannot be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PrimaryInputField(
                        obscureText: true,
                        controller: _passwordController,
                        labelText: passwordText,
                        prefixIcon: Icon(Icons.lock),
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'Password cannot be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Forgot password?',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                        buttonText:
                            snapshot.hasData && snapshot.data['loading'] == true
                                ? LinearProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                      AppColors.lightGreyColor,
                                    ),
                                  )
                                : Text(
                                    loginText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                        onPressed: snapshot.hasData &&
                                snapshot.data['loading'] == true
                            ? () {}
                            : () async {
                                if (_loginFormKey.currentState!.validate()) {
                                  _loginFormKey.currentState!.save();

                                  SharedPreferences _prefs =
                                      await SharedPreferences.getInstance();
                                  // handle login
                                  StoreProvider.dispatch(
                                    context,
                                    LoginAction(
                                      emailAddress: EmailAddress.withValue(
                                        input: _emailController.text,
                                      ),
                                      password: _passwordController.text,
                                      cacheService: CacheService(
                                        cacheRepository: CacheRepository(
                                          sharedPreferences: _prefs,
                                        ),
                                      ),
                                      loginStreamController:
                                          _loginStreamController,
                                    ),
                                  );
                                }
                              },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (snapshot.hasError)
                        Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.redAccent,
                          child: Center(
                            child: Text(
                              snapshot.error.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
