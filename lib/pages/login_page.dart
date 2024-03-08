import 'dart:ffi';

import 'package:book_me/components/my_button.dart';
import 'package:book_me/components/my_textfield.dart';
import 'package:book_me/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // signUserIn method
  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //logo
                  Image.asset(
                    'lib/images/booknest-green.png',
                    height: 100,
                  ),

                  // const Icon(
                  //   Icons.lock,
                  //   size: 100,
                  // ),
                  const SizedBox(
                    height: 50,
                  ),

                  //welcome back you've been missed!

                  Text(
                    'مرحباً بك في بوكنيست ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  //email textfield
                  MyTextField(
                    controller: emailcontroller,
                    hintText: ' الايميل',
                    obscureText: false,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                  ),

                  const SizedBox(height: 10),

                  //password textfield
                  MyTextField(
                    controller: passwordcontroller,
                    hintText: 'كلمة المررور',
                    obscureText: true,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // forgot password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'نسيت كلمة المرور؟ ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  MyButton(
                    onTap: signUserIn,
                    title: 'تسجيل دخول',
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // or continue with

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'أو الاستمرار مع',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  //google + apple sign in buttons
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //google
                      SquareTile(imagePath: 'lib/images/google.png'),
                      SizedBox(width: 25),

                      //apple
                      SquareTile(imagePath: 'lib/images/apple-logo.png'),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // not a member ? register now

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'سجل الان',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ' ليس عضوا؟',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
