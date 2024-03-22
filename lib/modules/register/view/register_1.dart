import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/app_utils.dart';
import 'package:photogram/modules/register/view/email_verifing.dart';
import 'package:photogram/modules/room/view/room.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 105),
              child: Text(
                "Login VIA Email",
                style: GoogleFonts.comfortaa(fontSize: 36),
              ),
            ),
            SizedBox(
              height: AppSizing.screenSizeonHeight(32),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'gajanand@example.com',
                      hintStyle: TextStyle(color: Colors.black))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '********',
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
            ),
            AppUtils.commonButtonFullWidth("Register", () {
              register1(context);
            })
          ],
        ),
      ),
    );
  }

  Future<void> register1(context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userCredential.user?.emailVerified == true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return const Room();
        }), (p) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return const VerifyEmail();
        }), (p) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The password provided is too weak.'),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'email-already-in-use') {
        login(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Something Went Wrong'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> login(context) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential.user?.emailVerified == true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return const Room();
        }), (p) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return const VerifyEmail();
        }), (p) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No User Found for that Email'),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('wrong-password'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
