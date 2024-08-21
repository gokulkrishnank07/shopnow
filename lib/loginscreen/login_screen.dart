// ignore_for_file: use_build_context_synchronously, empty_catches

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shopnow/btm_navigation/btm_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loging(String emilys, emilyspass) async {
    try {
      Response response = await post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: {'username': emilys, 'password': emilyspass},
      );

      if (response.statusCode == 200) { 
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BtmNavigation(),
          ),
        );

        jsonDecode(response.body.toString());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Invalid Email or Password")));
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 225,
                  child: Image.asset(
                    'images/logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      "SHOP NOW!",
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 27, 137, 97),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      textAlign: TextAlign.center,
                      "Buy less, choose well..",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Email',
                      labelStyle: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 27, 137, 97),
                          fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    style: const TextStyle(),
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 27, 137, 97),
                          fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                  width: 40,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      loging(emailController.text.toString(),
                          passwordController.text.toString());
                      FocusScope.of(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 27, 137, 97),
                      shadowColor: Colors.black,
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
