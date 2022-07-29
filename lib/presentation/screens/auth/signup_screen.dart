import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:foodelo/controller/provider/user_provider.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/presentation/routers/router.dart';
import 'package:foodelo/presentation/screens/auth/otpverify_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpKey = GlobalKey<FormState>();
  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _signUpKey.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30.0,
                      bottom: 30.0,
                    ),
                    child: Text(
                      'Create Account',
                      style: AppStyle.headline3.copyWith(
                        color: AppColor.lightColorScheme.onSurface,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: _signUpKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppFormField(
                              text: 'Full Name',
                              controller: _fullname,
                              hintText: 'Enter your fullname',
                              validator: AppValidator.validate,
                            ),
                            AppFormField(
                              text: 'Email address',
                              controller: _email,
                              hintText: 'Enter Email',
                              validator: AppValidator.email,
                            ),
                            AppFormField(
                              text: 'Password',
                              controller: _password,
                              hintText: 'Enter Password',
                              validator: AppValidator.password,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Center(
                              child: AppButton(
                                title: 'Sign Up',
                                onPressed: () {
                                  if (_signUpKey.currentState!.validate()) {
                                    UserProvider()
                                        .singUp(
                                      name: _fullname.text,
                                      email: _email.text,
                                      password: _password.text,
                                    )
                                        .then(
                                      (value) {
                                        final progress =
                                            ProgressHUD.of(context);
                                        progress?.showWithText('Loading...');
                                        if (value.success == false) {
                                          Future.delayed(
                                              const Duration(
                                                seconds: 1,
                                              ), () {
                                            progress?.dismiss();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "${value.errors?[0].msg}"),
                                                backgroundColor: Colors.red,
                                                duration: const Duration(
                                                  seconds: 1,
                                                  microseconds: 100,
                                                ),
                                              ),
                                            );
                                          });
                                        } else {
                                          Future.delayed(
                                              const Duration(
                                                seconds: 1,
                                              ), () {
                                            progress?.dismiss();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "${value.user?.message}"),
                                                backgroundColor: Colors.green,
                                                duration: const Duration(
                                                  seconds: 1,
                                                  microseconds: 100,
                                                ),
                                              ),
                                            );
                                          });

                                          Timer(
                                            const Duration(seconds: 2),
                                            () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OtpVerifyScreen(
                                                    email: _email.text,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: AppStyle.bodyText1.copyWith(
                                    color: AppColor
                                        .lightColorScheme.inverseSurface,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: 'Sign In',
                                        style: AppStyle.bodyText1.copyWith(
                                          color:
                                              AppColor.lightColorScheme.primary,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                              context,
                                              Foodelo.signIn,
                                            );
                                          }),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
