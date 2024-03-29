import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controller/api_call.dart';
import '../user_details/passwordSignin.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    final pswdUser = Provider.of<PasswordSigninProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Sign Up',
      //       style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Colors.black87, Colors.black],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://mebincdn.themebin.com/1664962508289.png'),
                fit: BoxFit.cover),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 78, 78),
                Color.fromARGB(255, 34, 32, 27),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://niceillustrations.com/wp-content/uploads/2020/09/Person-With-Shopping-Cart.png'),
                          fit: BoxFit.contain),
                    ),
                    height: height / 2.5,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 70.0,
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'email',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.white24,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .white, // set the border color here
                                  ),
                                ),
                                suffixStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors
                                    .white, // set the input text color here
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70.0,
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'password',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.white24,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .white, // set the border color here
                                  ),
                                ),
                                suffixStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors
                                    .white, // set the input text color here
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70.0,
                            child: TextFormField(
                              controller: _fullNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Full Name',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.white24,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .white, // set the border color here
                                  ),
                                ),
                                suffixStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors
                                    .white, // set the input text color here
                              ),
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Container(
                            width: MediaQuery.of(context).size.width * .85,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 189, 189, 189),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  pswdUser
                                      .signUpWithEmailAndPassword(
                                        _emailController.text,
                                        _passwordController.text,
                                        _fullNameController.text,
                                        'https://static.vecteezy.com/system/resources/previews/008/442/086/original/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg',
                                      )
                                      .then((value) => dataProvider
                                          .navigateToHomepage(context));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xff161b27),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Already have an account ? ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  dataProvider.navigateToLoginPage(context);
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 202, 231, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
