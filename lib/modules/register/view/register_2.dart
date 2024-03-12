import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/app_utils.dart';
import 'package:photogram/modules/room/view/room.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
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
                "Register",
                style: GoogleFonts.comfortaa(fontSize: 36),
              ),
            ),
            SizedBox(
              height: AppSizing.screenSizeonHeight(32),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "the_gajanand")),
            ),
            AppUtils.commonButtonFullWidth("SIGN UP", () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return const Room();
              })));
            }),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                height: AppSizing.screenSizeonHeight(33),
                child: const Text(
                    "By signing up, you agree to Photo's Terms of Service and Privacy Policy."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
