import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const blueColor = Color(0xFF2356C8);
const pinkColor = Color(0xFFE91E63);
const greyColor = Color(0xFF43454C);
const blackColor = Color(0xFF272727);
const redColor = Color(0xFFFF5722);
const greyListContactColor = Color(0xFFF5F5F5);

// Noted GlobalFontWeight
FontWeight light = FontWeight.w300;
FontWeight normal = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

TextStyle blueTextFont =
    GoogleFonts.openSans(color: blueColor, fontWeight: normal, fontSize: 15);

TextStyle blackTextFont =
    GoogleFonts.openSans(color: blackColor, fontWeight: normal, fontSize: 15);

TextStyle greyTextFont =
    GoogleFonts.openSans(color: greyColor, fontWeight: normal, fontSize: 15);

TextStyle whiteTextFont =
    GoogleFonts.openSans(color: Colors.white, fontWeight: normal, fontSize: 15);

TextStyle blackLightTextFont = blackTextFont.copyWith(fontWeight: light);
