import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/widgets/navbar_widget.dart';
import 'package:provider/provider.dart';
import 'consts/theme.dart';
import 'providers/navbar_provider.dart';
import 'providers/news_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: StyleTheme.themeData(),
      home: const NavbarWidget(),
    );
  }
}
