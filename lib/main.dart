import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_lomboknation/auth_services.dart';
import 'package:tubes_lomboknation/login.dart';
import 'package:tubes_lomboknation/register.dart';
import 'package:tubes_lomboknation/screens/homescreen_screens.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => authServices()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: LoginPage(),
    );
  }
}
