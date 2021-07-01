import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/redux/actions/login_action.dart';
import 'package:prospect_app/domain/core/app_strings.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/presentation/app/customer/pages/auth/widgets/primary_button.dart';
import 'package:prospect_app/presentation/app/customer/pages/auth/widgets/primary_input_field.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: 'test@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'maichstivo254@gmail.com');

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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _loginFormKey,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                      snapshot.hasData && snapshot.data['loading'] == true
                          ? Center(child: CircularProgressIndicator())
                          : PrimaryButton(
                              buttonText: snapshot.hasData &&
                                      snapshot.data['authenticated']
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 35,
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
                                      snapshot.data['authenticated']
                                  ? () {}
                                  : () {
                                      if (_loginFormKey.currentState!
                                          .validate()) {
                                        _loginFormKey.currentState!.save();

                                        StoreProvider.dispatch(
                                          context,
                                          LoginAction(
                                            loginStreamController:
                                                _loginStreamController,
                                            emailAddress:
                                                EmailAddress.withValue(
                                              input: _emailController.text,
                                            ),
                                            password: _passwordController.text,
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
                          height: 70,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => _loginStreamController
                                    .add({'loading': false}),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  snapshot.error.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
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
