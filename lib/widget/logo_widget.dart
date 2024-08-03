import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appLogo() {
  return Image.asset("assets/images/pic1.png")
      .box
      .white
      .size(77, 77)
      .padding(EdgeInsets.all(8))
      .roundedFull
      .make();
}
