import 'package:flutter/material.dart';
import 'package:electrical_stor_app/models/screens/home_screen.dart';
import 'package:electrical_stor_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electrical Store',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
        ),
        // 🎯 الطريقة الحديثة والآمنة لتطبيق الخط العربي على الثيم بالكامل
        textTheme: GoogleFonts.almaraiTextTheme(),
      ),
      localizationsDelegates: [
        // 👇 إضافة دعم اللغة العربية
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // 👇 إضافة دعم اللغة العربية
        Locale('ar', 'AE'), // Arabic
      ],
      locale: Locale("ar", "AE"), // 👈 تعيين اللغة الافتراضية للتطبيق إلى العربية
      home: HomeScreen(),
    );
  }
}
