

import 'package:flutter/material.dart';
import 'package:multi_provider/ui/screens/home_screen.dart';

class RouterGenerator {

  /// Route name
  static const routeHome = "/home";
    
  static Route<dynamic> generate(RouteSettings settings) {
    
    switch(settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
    }
    return null;
  }
}