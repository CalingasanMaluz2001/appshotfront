import 'package:appshotfront/pages/dashboard.dart';
import 'package:appshotfront/pages/login.dart';
import 'package:appshotfront/pages/menu.dart';
import 'package:appshotfront/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:appshotfront/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
  },
));