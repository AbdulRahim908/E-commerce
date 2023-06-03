import 'package:ecommerce/screens/addProduct.dart';
import 'package:ecommerce/screens/allProduct.dart';
import 'package:ecommerce/screens/appscreen.dart';
import 'package:ecommerce/screens/signUpView.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'homeView.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController email_control = TextEditingController();
  TextEditingController pass_control = TextEditingController();
  @override
  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email_control.text, password: pass_control.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AppScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 200,),
              const Text(
                '''Welcome back to
        Mega mall''',
                style: TextStyle(fontSize: 35),
              ),SizedBox(
                height: 40,
              ),
               Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 80,
                    child: TextField(controller: email_control,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          hintText: 'Enter Your email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email)),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 350,
                  child: TextField(controller: pass_control,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'Enter Your Password',
                        labelText: 'password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye)),
                  ),
                ), SizedBox(
                height: 40,
              ),
              SizedBox(width: 350,
                height: 50,
                child: ElevatedButton( style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      side: const BorderSide(width: 2, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      login(context);
                    },
                    child: Text("Login")),
              )
            ,SizedBox(height: 45,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupView()));
                  },
                  child: Text("Did not have account Signup?"))],
          ),
        ),
      ),
    );
  }
}
