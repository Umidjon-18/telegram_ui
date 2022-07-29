import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telegram_ui/pages/home_page.dart';
import 'package:telegram_ui/pages/login_page.dart';
import 'pages/contacts_page.dart';
import 'pages/lock_page.dart';
import 'pages/search_page.dart';
import 'pages/settings_page.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        HomePage.id: (context) => const HomePage(),
        SearchPage.id: (context) => const SearchPage(),
        ContactsPage.id: (context) => const ContactsPage(),
        LockPage.id: (context) => const LockPage(),
        SettingsPage.id: (context) => const SettingsPage(),
      },
    );
  }
}
