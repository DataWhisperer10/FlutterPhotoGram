import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';

class AppUtils {
  static Widget commonButtonFullWidth(String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSizing.screenSizeonHeight(52),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(),
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: AppSizing.screenSizeonHeight(13),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
