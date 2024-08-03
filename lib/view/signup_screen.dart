import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/const/color.dart';
import 'package:firebasedemo/utils/utils.dart';
import 'package:firebasedemo/view/login_screen.dart';
import 'package:firebasedemo/widget/button_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController paswordcontoller = TextEditingController();
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void signup() {
    setState(() {
      loading = true;
    });
    // signupFunc1();
    // loading = true;
    _auth
        .createUserWithEmailAndPassword(
            email: emailcontoller.text.toString(),
            password: paswordcontoller.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, StackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  //@override
  //signupFunc1() {
  // async {
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailcontoller.text,
  //       password: paswordcontoller.text,
  //     );
  //     print(credential);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       Utils().toastMessage(e.code.toString());
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     } else {
  //       print(e.code);
  //     }
  //   } catch (e) {
  //     print(e);
  //     setState(() {
  //       Utils().toastMessage(e.toString());
  //     });
  //   }
  //   print("Tes");
  //   // Utils().toastMessage(toString());
  //}

  @override
  void dispose() {
    emailcontoller.dispose();
    paswordcontoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Sign up"),
      ),
      body: Container(
        color: Colors.green,
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
              text: 'Sign up',
              loading: loading,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  signup();
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
