import 'package:flutter/material.dart';
import 'package:foodelo/app.dart';
import 'package:foodelo/controller/controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: const MyApp(),
    ),
  );
}
