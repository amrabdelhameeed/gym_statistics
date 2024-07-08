import 'package:flutter/material.dart';
import 'package:gym_statistics/shared_data/core/app_colors.dart';

class AppTheme {
  static textStyleFontFamilyBasedOnLocale(locale) => TextStyle(
        fontFamily: locale == 'en' ? "sans" : "kufi",
      );
  static ThemeData lightTheme(String locale) => ThemeData(
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
        primaryColor: AppColors.appColor,
        iconTheme: IconThemeData(color: Colors.grey[900]),
        scaffoldBackgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        primaryColorDark: AppColors.greyMid,
        primaryColorLight: Color.fromRGBO(230, 230, 230, 1),
        secondaryHeaderColor: Colors.grey[600],
        shadowColor: Colors.grey[200],
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((states) => AppColors.appColor),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey; // Disabled text color
              }
              return Colors.white; // Normal text color
            }),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(
                fontFamily: locale == 'en' ? "sans" : "kufi",
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
            bodyMedium: textStyleFontFamilyBasedOnLocale(locale),
            bodySmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            displayLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            displayMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            displaySmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            titleSmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            titleLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            titleMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            labelSmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            headlineMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            headlineLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            labelMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            headlineSmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            labelLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            bodyLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            )),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          unselectedLabelStyle: TextStyle(
            fontFamily: locale == 'en' ? "sans" : "kufi",
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color.fromRGBO(227, 202, 224, 1)),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          color: Colors.white,
          elevation: 2,
          iconTheme: IconThemeData(
            color: Colors.grey[900],
          ),
          actionsIconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      );

  static ThemeData darkTheme(String locale) => ThemeData(
        textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            bodySmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            displayLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            displayMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            displaySmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            titleSmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            titleLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            titleMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            labelSmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            headlineMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            headlineLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            labelMedium: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            headlineSmall: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            labelLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            ),
            bodyLarge: TextStyle(
              fontFamily: locale == 'en' ? "sans" : "kufi",
            )),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.greyDark),
        primaryColor: AppColors.appColorDarkMode,
        iconTheme: IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: AppColors.greyDark,
        highlightColor: Colors.black,
        primaryColorLight: Color.fromRGBO(42, 49, 57, 1),
        brightness: Brightness.dark,
        cardColor: Color.fromRGBO(30, 37, 43, 1),
        primaryColorDark: Colors.grey[300],
        secondaryHeaderColor: Colors.grey[400],
        shadowColor: Color(0xff282828),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: locale == 'en' ? "sans" : "kufi",
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontFamily: locale == 'en' ? "sans" : "kufi",
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color.fromRGBO(42, 49, 57, 1)),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          color: AppColors.greyDark,
          elevation: 2,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
      );
}
