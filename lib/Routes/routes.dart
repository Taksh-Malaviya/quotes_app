import 'package:flutter/material.dart';
import 'package:quotes_app/screen/Detail.dart';
import 'package:quotes_app/screen/homepage/homepage.dart';

class Routes {
  static String homescreen = "/";
  static String detailpage = "detail_page";

  static Map<String, WidgetBuilder> myRoutes = {
    homescreen: (context) => const HomePage(),
    detailpage: (context) => const Detail()
  };
}
