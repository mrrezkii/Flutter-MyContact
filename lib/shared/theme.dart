import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const blueColor = Color(0xFF2356C8);
const pinkColor = Color(0xFFE91E63);
const greyColor = Color(0xFF43454C);
const blackColor = Color(0xFF272727);
const redColor = Color(0xFFFF5722);

TextStyle blueTextFont = GoogleFonts.openSans()
    .copyWith(color: blueColor, fontWeight: FontWeight.w400, fontSize: 15);

TextStyle blackTextFont = GoogleFonts.openSans()
    .copyWith(color: blackColor, fontWeight: FontWeight.w400, fontSize: 15);

TextStyle greyTextFont = GoogleFonts.openSans()
    .copyWith(color: greyColor, fontWeight: FontWeight.w400, fontSize: 15);

TextStyle whiteTextFont = GoogleFonts.openSans()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15);

TextStyle blackLightTextFont =
    blackTextFont.copyWith(fontWeight: FontWeight.w300);
