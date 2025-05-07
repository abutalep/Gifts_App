import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gifts_app/views/functions/showSnackBarFunction.dart';
import 'package:gifts_app/views/screens/homePage.dart';
import 'package:gifts_app/views/screens/signUp.dart';
import 'package:gifts_app/views/widgets/custom_button.dart';
import 'package:gifts_app/views/widgets/custom_clipPath.dart';
import 'package:gifts_app/views/widgets/custom_textFormField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

String? email, password;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
GlobalKey<FormState> formKey = GlobalKey();
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
}
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
                      height: 60,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome To\nGifts App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "LOGIN",
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
                      controller: emailController,
                      onChanged: (data) {
                        email = data;
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
                      height: 14,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      onChanged: (data) {
                        password = data;
                      },
                      labelText: "Password",
                      hintText: "Enter your password",
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
                      text: "LOGIN",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          final UserCredential credential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                            email: email!,
                            password: password!,
                          );
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-credential') {
                            showSnackBar_Function(context,
                                text: "Wrong email or password.");
                          } else {
                            showSnackBar_Function(context,
                                text: "${e.toString()}");
                          }
                        } catch (e) {
                          showSnackBar_Function(context, text: "${e.toString()}");
                        }
                        isLoading = false;
                        setState(() {});
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
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          
                          onTap: () {
                            setState(() {
                              emailController.clear();
                              passwordController.clear();
                            });
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                          },
                          child: const Text(
                            " Sign Up",
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