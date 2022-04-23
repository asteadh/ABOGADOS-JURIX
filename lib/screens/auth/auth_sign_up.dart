import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:jurix_abogados/screens/signIn/con_iniciar_sesion.dart';

import 'package:logger/logger.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../services/firebase_auth_service.dart';

import '../../styles/colors/colors.dart';
import '../../styles/input_fields.dart';
import '../main/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen(
      {Key? key, required this.title, required this.toggleAuthScreen})
      : super(key: key);
  final String title;
  final Function toggleAuthScreen;

  @override
  State<SignUpScreen> createState() => _SignUpScrensState();
}

class _SignUpScrensState extends State<SignUpScreen> {
  var logger = Logger();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final _signUpForm = GlobalKey<FormState>();
  String email = "null";
  String pass = "null";
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String _signInError = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Image(
                  image: const AssetImage('assets/logos/jurix_logo.png'),
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                PlatformText(
                  "Create yours space",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Form(
                    key: _signUpForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          decoration: inputFieldContainer,
                          child: TextFormField(
                            style: inputFieldText,
                            controller: emailController,
                            decoration: emailField,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (val) => val!.isEmpty
                                ? "Enter your email"
                                : (!val.isEmail ? "Enter valid email" : null),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          decoration: inputFieldContainer,
                          child: TextFormField(
                            style: inputFieldText,
                            controller: passController,
                            decoration: passField,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                pass = val;
                              });
                            },
                            validator: (val) => val!.isEmpty
                                ? "Enter your password"
                                : ((val.length < 6)
                                    ? "Password should contain 6 characters!"
                                    : null),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PlatformElevatedButton(
                          // style: ElevatedButton.styleFrom(
                          //     padding:
                          //         const EdgeInsets.symmetric(vertical: 16.0)),
                          onPressed: () async {
                            if (_signUpForm.currentState!.validate()) {
                              dynamic _signUpResult = await _firebaseAuthService
                                  .signUp(email, pass);
                              if (_signUpResult != null &&
                                  !_signUpResult
                                      .toString()
                                      .contains("AuthException:")) {
                                logger.i("SignUp Success");

                                //CAMBIO
                                Get.offAll(() => ConIniciarSesion());
                              } else {
                                _signInError = _signUpResult.toString();
                                _firebaseSignInErrorAlert(context);
                                logger.e(_signUpResult.toString());
                              }
                            } else {
                              logger.e("Unable to validate sign up form!!");
                            }
                          },
                          child: PlatformText("Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontSize: 20.0))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlatformText("Already have an account ?",
                        style: Theme.of(context).textTheme.bodyText2),
                    PlatformTextButton(
                        onPressed: () async {
                          widget.toggleAuthScreen();
                        },
                        child: PlatformText(
                          "Sign In",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(fontSize: 20.0),
                        ))
                  ],
                )
              ],
            )),
      )),
    );
  }

  _firebaseSignInErrorAlert(BuildContext context) {
    final errMessageArray = _signInError.split(' ');
    final title = errMessageArray[0];
    final desc = errMessageArray[1];
    Alert(
      style: AlertStyle(
          overlayColor: spaceGray,
          animationType: AnimationType.grow,
          animationDuration: const Duration(milliseconds: 600)),
      context: context,
      title: title,
      desc: desc,
      image: const Icon(
        Icons.error_rounded,
        color: Colors.red,
        size: 60.0,
      ),
      buttons: [
        DialogButton(
          color: color2,
          child: PlatformText("Try again"),
          onPressed: () => Navigator.pop(context, false),
        ),
      ],
      content: Container(
        padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
        child: Row(
          children: [
            Expanded(
              child: PlatformText(
                "Already have an account? ",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            PlatformElevatedButton(
                // style: ElevatedButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 10.0, horizontal: 10.0)),
                onPressed: () {
                  widget.toggleAuthScreen();
                  Navigator.pop(context, false);
                },
                child: PlatformText("Sign In now"))
          ],
        ),
      ),
    ).show();
  }
}
