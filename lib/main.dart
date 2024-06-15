import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysqlpractise/users/authentication/login_screen.dart';
import 'package:mysqlpractise/users/fragments/dof.dart';
import 'package:mysqlpractise/users/userPreferences/userpreferences.dart';
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(future: RememberUserPrefs.readUserInfo(), builder: (context, dataSnapShot){
        if(dataSnapShot.data==null){
          return Loggin();
        }
        else{
          return DashboardOfFragments();
        }
      })
    );
  }
}