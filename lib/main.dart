import 'package:firebasedemo/const/string.dart';
import 'package:firebasedemo/view/addstd.dart';
import 'package:firebasedemo/view/home_store_screen.dart';

import 'package:firebasedemo/view/login_screen.dart';

import 'package:firebasedemo/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: appname,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            appBarTheme: AppBarTheme(backgroundColor: Colors.transparent)
            //fontFamily: regular
            ),
        home: HomeScreen()
        //AddStdFeeScreen()
        // LoginScreen()

        //SplashScreen(),
        );
  }
}

// https://github.com/Nabinji/flutter_project/blob/main/lib/Navigation%20Drawer/contact.dart