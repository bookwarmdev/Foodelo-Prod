import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:foodelo/controller/controller.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/presentation/routers/router.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String? email;
  const OtpVerifyScreen({Key? key, this.email}) : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  String? otp;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: AppColor.lightColorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.lightColorScheme.primaryContainer,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return Scaffold(
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      size: 30,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verify Email ',
                        style: AppStyle.headline3.copyWith(
                          color: AppColor.lightColorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Code is send to ${widget.email}",
                        style: AppStyle.subtitle1.copyWith(
                          color: AppColor.lightColorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Pinput(
                  length: 6,
                  animationCurve: Curves.easeIn,
                  defaultPinTheme: defaultPinTheme,
                  onChanged: (value) {
                    otp = value;
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Center(
                child: AppButton(
                  title: 'Verify and Create Account',
                  onPressed: () {
                    UserProvider()
                        .verifyOtp(email: widget.email, otp: otp)
                        .then(
                      (value) {
                        final progress = ProgressHUD.of(context);
                        progress?.showWithText('Loading...');
                        if (value.user?.success == false) {
                          Future.delayed(
                              const Duration(
                                seconds: 1,
                              ), () {
                            progress?.dismiss();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${value.user?.message}"),
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${value.user?.message}"),
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
                              Navigator.pushNamed(
                                context,
                                Foodelo.homeScreen,
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
