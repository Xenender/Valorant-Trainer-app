import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData themeValo = ThemeData(

      textTheme: TextTheme(
        bodyLarge: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        bodyMedium: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        bodySmall: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        displayLarge: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        displayMedium: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        displaySmall: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        headlineLarge: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        headlineMedium: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        headlineSmall: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        titleLarge: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        titleMedium: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        titleSmall: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        labelLarge: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        labelMedium: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),
        labelSmall: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),



      ),
      colorScheme: ColorScheme(

        //primary: Color(0xFFF2B872),             // Couleur principale
        primary: Color(0xFFFFFFFF),
        onPrimary: Colors.white,          // Couleur du texte sur la couleur principale
        //secondary: Color(0xFFF27B50),          // Couleur secondaire
        secondary: Color(0xFFFD4554),
        onSecondary: Colors.white,
        tertiary: Color(0xFF0F1923),
        onTertiary: Colors.white,




        background: Color(0xFF0F1923),        // Couleur d'arrière-plan
        brightness: Brightness.light,     // Luminosité (light)// Couleur du texte sur la couleur secondaire
        error: Colors.red,                // Couleur en cas d'erreur
        onError: Colors.white,            // Couleur du texte en cas d'erreur
        onBackground: Colors.white,       // Couleur du texte sur l'arrière-plan
        surface: Color(0xFF0F1923),             // Couleur de surface
        onSurface: Colors.white,          // Couleur du texte sur la surface
      )
      ,
      buttonTheme: ButtonThemeData(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Ajustez la valeur pour définir la rondeur de la bordure
        ),


      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(

            backgroundColor: Color(0xFFFD4554),
            textStyle: GoogleFonts.montserrat(textStyle: TextStyle(),color: Colors.white),


            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              // Ajustez la valeur pour définir la rondeur de la bordure
            ),

          )
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Ajustez la valeur pour définir la rondeur de la bordure
        ),

      ),

    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xFFFD4554),
      valueIndicatorColor: Color(0xFFFD4554),
      thumbColor: Color(0xFFFD4554)
    )
      ,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Color(0xFFFD4554),
      linearTrackColor: Color(0xFFFFFFFF)

  )



  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    backgroundColor: Colors.black,
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      // ...
    ),
  );
}