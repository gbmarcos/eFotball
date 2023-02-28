import 'package:fifa/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


enum ThemeMode

class CustomTheme {
  late final Color bg;
  final Color primary;
  final bool isDark;

  /// Default constructor
  CustomTheme({this.isDark = false, required this.primary, Color? backgroundColor}) {
    if (backgroundColor != null) {
      bg = backgroundColor;
    } else if (isDark) {
      bg = const Color(0xff282c30);
    } else {
      bg = Colors.white;
    }
  }

  ThemeData get themeData {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    final txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    const txtColor = Color(0xff181818);
    final colorScheme = ColorScheme(
        // Decide how you want to apply your own custom them, to the MaterialApp
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryVariant: primary,
        secondary: primary,
        secondaryVariant: primary,
        background: bg,
        surface: bg,
        onBackground: txtColor,
        onSurface: txtColor,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);

    /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
    final t = ThemeData.from(
      textTheme: txtTheme,
      colorScheme: colorScheme,
    )
        // We can also add on some extra properties that ColorScheme seems to miss
        .copyWith(highlightColor: primary, toggleableActiveColor: primary, primaryColor: primary);

    /// Return the themeData which MaterialApp can now use
    return t;
  }

  ThemeData get fifaThemeData {
    return themeData.copyWith(
        // Define the default brightness and colors.
        canvasColor: R.colors.cardBackground,
        primaryColor: R.colors.background,
        backgroundColor: R.colors.background,
        scaffoldBackgroundColor: R.colors.background,
        appBarTheme: AppBarTheme(
          backgroundColor: R.colors.menuBarBackground,
          centerTitle: false,
          titleTextStyle: const TextStyle(),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        cardColor: R.colors.menuBarBackground,
        dialogBackgroundColor: R.colors.menuBarBackground,
        errorColor: Colors.deepOrangeAccent,
        indicatorColor: R.colors.orange,
        focusColor: R.colors.orange,
        highlightColor: R.colors.orange,
        toggleableActiveColor: R.colors.orange,
        hintColor: R.colors.inputBoxTextInitiative,
        inputDecorationTheme: R.appDecorations.commonFieldDecoration,
        unselectedWidgetColor: R.colors.iconColourOff,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: R.colors.orange,
            onPrimary: R.colors.background,
            onSurface: R.colors.iconColourOff,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: R.colors.orange,
            onSurface: R.colors.iconColourOff,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
            side: BorderSide(width: .7, color: R.colors.orange),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          primary: R.colors.orange,
        )),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: R.colors.orange,
          selectionColor: R.colors.orange,
          selectionHandleColor: Colors.white,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: R.colors.cardBackground,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          splashColor: R.colors.menuBarBackground.withOpacity(.5),
        ),
        snackBarTheme: SnackBarThemeData(
            backgroundColor: R.colors.menuBarBackground,
            actionTextColor: R.colors.orange,
            contentTextStyle: const TextStyle(color: Colors.white)),
        chipTheme: ChipThemeData.fromDefaults(
            secondaryColor: R.colors.orange,
            labelStyle: const TextStyle(color: Colors.white),
            brightness: Brightness.dark),
        // Define the default font family.
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.white,
          labelColor: R.colors.orange,
        ),
        dividerTheme: DividerThemeData(color: R.colors.menuBarBackground)

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: const TextTheme(),

        );
  }
}
