import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photogram/modules/room/view/room.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  Timer? timer;
  @override
  void initState() {
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer = Timer(const Duration(seconds: 2), () {
      FirebaseAuth.instance.currentUser?.reload().then((value) {
        if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return const Room();
          }), (p) => false);
          timer?.cancel();
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(child: Image.asset("assets/email_verify.jpg")),
                const SizedBox(height: 50),
                const Text("Email Verification is Under Process"),
                const LinearProgressIndicator(),
                const SizedBox(height: 50)
              ],
            )
            // ),
            ));
  }
}
