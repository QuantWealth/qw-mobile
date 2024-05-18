import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const bg = black;
const black = Colors.black;
const white = Color(0xffFFFFFF);
const bottomBarGrey = Color(0xff262626);
const qw1D1D1D = Color(0xff1D1D1D);
const qw444444 = Color(0xff444444);

const black100 = Color(0xff454545);
const black200 = Color(0xff454545);
const black300 = Color(0xff1A1A1A);
const black500 = Color(0xff2D2D2D);
const black700 = Color(0xff202020);
const black800 = Color(0xff1A1A1A);
const black900 = Color(0xff131313);

const gray900 = Color(0xff666666);
const gray800 = Color(0xff929292);
const gray700 = Color(0xffADADAD);
const gray600 = Color(0xff8A8A8A);
const gray100 = Color(0xffFCFCFC);
const gray200 = Color(0xffF5F5F5);
const gray300 = Color(0xffe9e9e9);
const gray500 = Color(0xffD9D9D9);

TextStyle fontH(
  double size, {
  Color? color,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w900,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

TextStyle fontB(
  double size, {
  Color? color,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

TextStyle fontSB(
  double size, {
  Color? color,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

TextStyle fontM(
  double size, {
  Color? color,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

TextStyle fontR(
  double size, {
  Color? color,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

TextStyle fontL(
  double size, {
  Color? color,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

TextStyle fontTH(
  double size, {
  Color? color,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w100,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

TextStyle fontStroke(double size, {Color? color, Color? outlineColor}) =>
    TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w800,
      // color: color ?? gray100,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = outlineColor ?? Colors.white,
      letterSpacing: -0.6,
    );

TextStyle fontTitle({
  Color? color,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

TextStyle fontBoldEmpty({
  Color? color = gray100,
  double? letterSpacing,
  double? lineHeight = 1.5,
}) =>
    TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color ?? gray100,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
}
