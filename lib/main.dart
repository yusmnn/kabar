import 'package:flutter/material.dart';
import 'package:flutter_news_app/ui/widgets/navbar_widget.dart';
import 'package:provider/provider.dart';

import 'consts/global_const.dart';
import 'providers/navbar_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavbarProvider()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: const NavbarWidget(),
    );
  }
}
