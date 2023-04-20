import 'package:e_commerce_advance/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

// Theme.of(context).textTheme.headline1
// Theme.of(context).colorScheme.background
class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      // titleTextStyle: TextStyle(
      //   color:AppColors.textColor,

      // fontFamily: "Roboto",
      // fontWeight: FontWeight.bold,fontSize: 26 ),
      elevation: 0,
      titleTextStyle:
          textTheme.headlineMedium!.apply(color: AppColors.whiteColor),

      backgroundColor: AppColors.appBarColor,

      iconTheme: const IconThemeData(color: AppColors.whiteColor),
    ),
    scaffoldBackgroundColor: AppColors.greyColor,
    primaryColor: AppColors.buttonColor,
    fontFamily:AppFont.rubik ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
    colorScheme: ColorScheme.light(
      
      onError: AppColors.infoColor,
      error: AppColors.errorColor,
      background: AppColors.greyColor,
      primary: AppColors.buttonColor,

      onPrimary: AppColors.buttonColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.buttonColor, size: 18),
    textTheme: textTheme,
  );

  // static final ThemeData darkTheme = ThemeData(
  //   scaffoldBackgroundColor: _darkPrimaryVariantColor,
  //   appBarTheme: AppBarTheme(
  //     color: _darkPrimaryVariantColor,
  //     iconTheme: IconThemeData(color: _darkOnPrimaryColor),
  //   ),
  //   colorScheme: ColorScheme.dark(
  //     primary: _darkPrimaryColor,
  //     primaryVariant: _darkPrimaryVariantColor,
  //     secondary: _darkSecondaryColor,
  //     onPrimary: _darkOnPrimaryColor,
  //     background: Colors.white12,
  //   ),
  //   iconTheme: IconThemeData(
  //     color: _iconColor,
  //   ),
  //   textTheme: _darkTextTheme,
  //     dividerTheme: DividerThemeData(
  //         color: Colors.black
  //     )  );

  static final TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.rubik(
        fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.blackColor),
    headlineMedium: GoogleFonts.rubik(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.blackColor),
    headlineSmall: GoogleFonts.rubik(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.blackColor),

    titleLarge: GoogleFonts.rubik(
        fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    titleMedium: GoogleFonts.rubik(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    titleSmall: GoogleFonts.rubik(
        fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.blackColor),
    bodyLarge: GoogleFonts.rubik(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.greyColor),
    bodyMedium: GoogleFonts.rubik(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.greyColor),
    bodySmall: GoogleFonts.rubik(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.greyColor),
    labelLarge: GoogleFonts.rubik(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    displayLarge: GoogleFonts.rubik(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    displayMedium: GoogleFonts.rubik(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),

    // static final TextTheme _darkTextTheme = TextTheme(
    //   headline1: _darkScreenHeading1TextStyle,
    // );
  );
}
