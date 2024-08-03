import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: AnotherCarousel(
            images: const [
              AssetImage("assets/images/pic.jpg"),
              AssetImage("assets/images/pic3.jpg"),
              AssetImage("assets/images/pic2.jpg"),
              // we have display image from netwrok as well
              NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg")
            ],
            dotSize: 6,
            indicatorBgPadding: 5.0,
          ),
        )
      ],
    );
  }
}
