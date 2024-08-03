import 'package:firebasedemo/const/color.dart';
import 'package:firebasedemo/view/home_store_screen.dart';
import 'package:firebasedemo/view/login_screen.dart';
import 'package:firebasedemo/widget/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => HomeScreen());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child:
                    //     Image.asset(
                    //       "assets/images/pic1.png",
                    //       width: 300,
                    //     )),
                    // 20.heightBox,
                    appLogo())
          ],
        ),
      ),
    );
  }
}
