import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/app_utils.dart';
import 'package:photogram/modules/room/view/room.dart';

class LoginViaMobileOtp extends StatefulWidget {
  const LoginViaMobileOtp({super.key});

  @override
  State<LoginViaMobileOtp> createState() => _LoginViaMobileOtpState();
}

class _LoginViaMobileOtpState extends State<LoginViaMobileOtp> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isOtpFieldVisible = false;
  late String verificationId;

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
                "Log in Via Mobile OTP",
                style: GoogleFonts.comfortaa(fontSize: 36),
              ),
            ),
            SizedBox(
              height: AppSizing.screenSizeonHeight(32),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0123456789',
                    hintStyle: TextStyle(
                        color: Colors.black26, fontWeight: FontWeight.w800)),
                controller: mobileNumberController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 10,
                keyboardType: TextInputType.number,
              ),
            ),
            Visibility(
              visible: isOtpFieldVisible,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'OTP Here',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                  controller: otpController,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ),
            AppUtils.commonButtonFullWidth(
                isOtpFieldVisible ? "Verify OTP" : "Send OTP", () {
              if (isOtpFieldVisible) {
                verifyOTP(context);
              } else {
                getOTP();
              }
              // Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              //   return const Room();
              // })));
            })
          ],
        ),
      ),
    );
  }

  getOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 {mobileNumberController.text}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          verificationId = verificationId;
          isOtpFieldVisible = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOTP(context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpController.text);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return Room();
      }), (p) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something Went Worng. Please try again later")));
    }
  }
}
