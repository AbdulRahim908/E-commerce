import 'package:ecommerce/screens/loginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  TextEditingController semail_control = TextEditingController();
  TextEditingController spass_control = TextEditingController();
  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: semail_control.text,
        password: spass_control.text,
      );
      print("User Addes Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Row(children: [  Expanded(
            child: ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 253, 254, 254)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      )),
                ),
              ),
          )],),
          SizedBox(height: 200,),
            const Text(
              "Register Account",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: SizedBox(
                  width: 350,
                  height: 80,
                  child: TextField(
                    controller: semail_control,
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
              child: TextField(
                controller: spass_control,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    hintText: 'Enter Your Password',
                    labelText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye)),
              ),
            ),          SizedBox(height: 45,),
      
            // GestureDetector(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: Text("back")),
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
                      signup(context);
                    },
                    child: Text("signUp")),
              ), SizedBox(height: 20,),GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: Text("Already have an account Signin?"))
        ]),
      ),
    );
  }
}
