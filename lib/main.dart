import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'consts/theme.dart';
import 'providers/navbar_provider.dart';
import 'ui/widgets/navbar_widget.dart';

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
