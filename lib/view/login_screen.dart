import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/const/color.dart';
import 'package:firebasedemo/utils/utils.dart';
import 'package:firebasedemo/view/home_store_screen.dart';
import 'package:firebasedemo/view/signup_screen.dart';
import 'package:firebasedemo/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController paswordcontoller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontoller.text.toString(),
            password: paswordcontoller.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Get.to(() => HomeScreen());
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
      setState(() {
        loading = false;
      });
    }).onError((error, StackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  // signinFunc1() async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailcontoller.text, password: paswordcontoller.text);

  //     print(credential);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     } else {
  //       print(e.code);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   print("Tes");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Login"),
      ),
      body: Container(
        color: Colors.amber,
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Text("Login"),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontoller,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: textfieldGrey),
                          hintText: "Email enter",
                          fillColor: lightGrey,
                          //  isDense: true,
                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: redColor),
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Email";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: paswordcontoller,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: textfieldGrey),
                          hintText: "Password enter",
                          fillColor: lightGrey,
                          //  isDense: true,

                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.password),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: redColor),
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " enter password";
                        }
                        return null;
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              text: 'Login',
              loading: loading,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  login();
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text("Sign up"))
              ],
            )
          ],
          // ),
        ),
      ),
    );
  }
}
