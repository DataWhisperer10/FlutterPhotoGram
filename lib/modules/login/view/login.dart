import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/app_utils.dart';
import 'package:photogram/modules/room/view/room.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                "Log in",
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
                      border: OutlineInputBorder(),
                      hintText: 'gajanand@example.com',
                      hintStyle: TextStyle(color: Colors.black))),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '.........',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold))),
            ),
            AppUtils.commonButtonFullWidth("LOG IN", () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return const Room();
              })));
            })
          ],
        ),
      ),
    );
  }
}
