import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/Routes/routes.dart';
import 'package:quotes_app/screen/homepage/homepage.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.actor().fontFamily,
      ),
      routes: Routes.myRoutes,
    );
  }
}
