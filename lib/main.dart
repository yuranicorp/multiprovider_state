import 'package:flutter/material.dart';
import 'package:multi_provider/core/viewmodels/cart.dart';
import 'package:multi_provider/core/viewmodels/money.dart';
import 'package:multi_provider/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Money(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        )
      ],
      child: MaterialApp(
        title: "Multi Provider",
        home: HomeScreen(),
      ),
    );
  }
}
