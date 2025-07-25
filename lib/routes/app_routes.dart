import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import '../auth/register_page.dart';
import '../home/home_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
  '/home': (context) => HomePage(),
};
