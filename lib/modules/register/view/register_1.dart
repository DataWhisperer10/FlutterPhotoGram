import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/app_utils.dart';
import 'package:photogram/modules/register/view/register_2.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
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
                  decoration: InputDecoration(border: OutlineInputBorder())),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder())),
            ),
            AppUtils.commonButtonFullWidth("NEXT", () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return const Register2();
              })));
            })
          ],
        ),
      ),
    );
  }
}
