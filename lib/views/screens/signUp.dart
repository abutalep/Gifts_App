// ignore_for_file: unused_local_variable, deprecated_member_use, file_names, use_build_context_synchronously, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gifts_app/views/functions/showDialogFunction.dart';
import 'package:gifts_app/views/functions/showSnackBarFunction.dart';
import 'package:gifts_app/views/screens/signIn.dart';
import 'package:gifts_app/views/widgets/custom_button.dart';
import 'package:gifts_app/views/widgets/custom_clipPath.dart';
import 'package:gifts_app/views/widgets/custom_textFormField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? email;

  String? password;

  String? confirmPassword;

  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Stack(
          children: [
            CustomClipPath(color: Color(0xff944BBB).withOpacity(.8),height: 624,),
            CustomClipPath(color: Color(0xff944BBB),height: 600,),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Gifts App",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      email=data;
                    },
                    labelText: "Email",
                    hintText: "Enter your email",
                    obscureText: false,
                    border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      password=data;
                    },
                    labelText: "Password",
                    hintText: "Create password",
                    obscureText: true,
                    suffixIcon: true,
                    border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      confirmPassword=data;
                    },
                    labelText: "Confirm Password",
                    hintText: "Rewrite password",
                    obscureText: true,
                    suffixIcon: true,
                    border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: "Sign Up",
                    onTap: () async {
                      if (password != confirmPassword) {
                        showDialog_Function(context,
                            title: "Error", content: "Passwords do not match");
                      } else {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            showDialog_Function(context,
                                title: "Successful",
                                content: "Registration successful!");
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignIn()),);

                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar_Function(context,
                                  text: "The password provided is too weak.");
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar_Function(context,
                                  text:
                                      "The account already exists for that email.");
                            } else {
                              showSnackBar_Function(context,
                                  text: "${e.toString()}");
                            }
                          } catch (e) {
                            showSnackBar_Function(context,
                                text: "${e.toString()}");
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      }
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                            color: Color(0xff944BBB),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),],
        ),
      ),
    );
  }
}