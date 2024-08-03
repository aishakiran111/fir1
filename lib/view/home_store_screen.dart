import 'package:firebasedemo/view/login_screen.dart';
import 'package:firebasedemo/view/page.dart';
import 'package:firebasedemo/view/product_page.dart';
import 'package:firebasedemo/view/signup_screen.dart';
import 'package:firebasedemo/view/splash_screen.dart';
import 'package:firebasedemo/widget/button_widget.dart';
import 'package:firebasedemo/widget/costomdrawar.dart';
import 'package:firebasedemo/widget/image_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List bottomNavScreens = [
    Column(
      children: [
        const Text(
          "Home Screen",
          style: TextStyle(fontSize: 40),
        ),
      ],
    ),
    PageScreen(),
    PageScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Drawer'),
      ),
      drawer: Costomdrawar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedFontSize: 50,
        onTap: (value) {
          selectedIndex = value;
          print(selectedIndex);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.safety_check), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.safety_check), label: "About"),
          BottomNavigationBarItem(
              icon: Icon(Icons.safety_check), label: "Profile")
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            ImageSlider(),
            bottomNavScreens[selectedIndex]
            // GridView(
            //     children: [
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.amberAccent,
            //       ),
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.amberAccent,
            //       ),
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.amberAccent,
            //       ),
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.amberAccent,
            //       ),

            //       ],
            //       shrinkWrap: true,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           mainAxisSpacing: 10,
            //           crossAxisSpacing: 10,
            //           mainAxisExtent: 340))
            ,
            ButtonWidget(
              text: 'product page',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductPage()));
              },
            )
          ]),
        ),
      ),
    );
  }
}
