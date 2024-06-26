import 'package:appshotfront/pages/dashboard.dart';
import 'package:appshotfront/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:appshotfront/home.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
  },
));