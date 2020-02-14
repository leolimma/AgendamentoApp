import 'package:agendamento_app/main.dart';
import 'package:flutter/material.dart';
import './update.dart';
import './add.dart';

 const String homeRoute = '/';
const String updateRoute = '/update';

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/update':
        return MaterialPageRoute(builder: (_) => UpdatePage());
        case '/add':
        return MaterialPageRoute(builder: (_) => AddPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

 