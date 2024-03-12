import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/modules/login/view/login.dart';
import 'package:photogram/modules/register/view/register_1.dart';

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
        bottomNavigationBar: bottomNav(height, width),
        body: screenBody(height, width));
  }

  Widget bottomNav(double height, double width) {
    return SizedBox(
      height: height / 9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: bootomNavButton('LOG IN', true),
            ),
            bootomNavButton('REGISTER', false)
          ],
        ),
      ),
    );
  }

  Widget bootomNavButton(buttonText, isLogin) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (isLogin) {
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
            return const Login();
          })));
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
            return const Register1();
          })));
        }
      },
      child: Container(
        height: height / 18,
        width: width / 2.25,
        decoration: BoxDecoration(
            color: isLogin ? null : Colors.black,
            border: Border.all(),
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.roboto(
                color: isLogin ? null : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget screenBody(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/bg_image.png',
              ),
              fit: BoxFit.fill)),
      child: Stack(
        children: [title(height, width), currentUserStatus()],
      ),
    );
  }

  Widget title(double height, double width) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: height / 15,
              width: width / 15,
              child: Center(
                child: Stack(
                  children: [
                    Image.asset("assets/union_1.png"),
                    Image.asset("assets/union.png")
                  ],
                ),
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
    );
  }

  Widget currentUserStatus() {
    return Positioned(
      bottom: AppSizing.screenSizeonHeight(30),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SizedBox(
          child: Row(
            children: [
              Container(
                height: AppSizing.screenSizeonHeight(28),
                width: AppSizing.screenSizeonWidth(28),
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/ram.jpg"), fit: BoxFit.fill)),
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
    );
  }
}
