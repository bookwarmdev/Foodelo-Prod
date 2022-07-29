import 'package:flutter/material.dart';
import 'package:foodelo/presentation/screens/auth/otpverify_screen.dart';
import 'package:foodelo/presentation/screens/auth/signin_screen.dart';
import 'package:foodelo/presentation/screens/auth/signup_screen.dart';
import 'package:foodelo/presentation/screens/home/cart/cart_screen.dart';
import 'package:foodelo/presentation/screens/home/cart/checkout_screen.dart';
import 'package:foodelo/presentation/screens/home/home_screen.dart';
import 'package:foodelo/presentation/screens/home/profile/profile_screen.dart';

class Foodelo {
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String otpVerifyScreen = "/otpVerifyScreen";
  static const String homeScreen = "/homeScreen";
  static const String cartScreen = "/cartScreen";
  static const String checkOutScreen = "/checkOutScreen";
  static const String profileScreen = "/profileScreen";
}

class AppRouter {
  static Route route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Foodelo.signIn:
        return MaterialPageRoute<Widget>(
          builder: (context) => const SignInScreen(),
        );
      case Foodelo.signUp:
        return MaterialPageRoute<Widget>(
          builder: (context) => const SignUpScreen(),
        );
      case Foodelo.otpVerifyScreen:
        return MaterialPageRoute<Widget>(
          builder: (context) => const OtpVerifyScreen(),
        );
      case Foodelo.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HoemScreen(),
        );
      case Foodelo.cartScreen:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case Foodelo.checkOutScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckOutScreen(),
        );
      case Foodelo.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Text("data"),
        );
    }
  }
}
