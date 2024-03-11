import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: height / 9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 9.0),
                child: Container(
                  height: height / 18,
                  width: width / 2.25,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Text(
                      'LOG IN',
                      style: GoogleFonts.roboto(
                          fontSize: min(25, width / 30),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // height: height / 18,
                  // width: width / 2.25,
                ),
              ),
              Container(
                height: height / 18,
                width: width / 2.25,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Text(
                    'REGISTER',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/bg_image.png',
                ),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: height / 15,
                      width: width / 15,
                      child: Stack(
                        children: [
                          Image.asset("assets/union_1.png"),
                          Image.asset("assets/union.png")
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "photo",
                    style: GoogleFonts.comfortaa(
                      fontSize: width / 10,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30, //(20 * 812) * 984,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: (28 / 812) * 984,
                  width: (135 / 375) * 1459,
                  child: Row(
                    children: [
                      Container(
                        height: (28 / 812) * 984,
                        width: (28 / 812) * 984,
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/ram.jpg"),
                                fit: BoxFit.fill)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gajanand",
                              style: GoogleFonts.roboto(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "@gaj_K",
                              style: GoogleFonts.roboto(fontSize: 10),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
