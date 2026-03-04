import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core_library.dart';


class UiTextStyles {
  static TextStyle heading24({
    Color color = UiThemeColors.neutral80,
    FontWeight fontWeight = FontWeight.bold,
    double height = 1.25,
  }) => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  static TextStyle heading20({
    Color color = UiThemeColors.neutral80,
    FontWeight fontWeight = FontWeight.w500,
    double height = 1.25,
  }) => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  static TextStyle heading16({
    Color color = UiThemeColors.neutral80,
    FontWeight fontWeight = FontWeight.w700,
    double height = 1.25,
  }) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  static TextStyle body14({
    Color color = UiThemeColors.black,
    FontWeight fontWeight = FontWeight.w400,
    double height = 1.63,
  }) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );


  static TextStyle body12({
    Color color = UiThemeColors.neutral80,
    FontWeight fontWeight = FontWeight.w500,
    double height = 14 / 12,
  }) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );
}
