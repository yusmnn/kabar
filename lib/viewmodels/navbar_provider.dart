import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/pages/explore_page.dart';
import 'package:flutter_news_app/view/pages/home_page.dart';

import '../view/pages/menu_page.dart';

class NavbarProvider with ChangeNotifier {
  List<NavbarData> items = [
    NavbarData(
      label: 'Home',
      widget: const HomePage(),
      iconData: Icons.home_rounded,
    ),
    NavbarData(
      label: 'Explore',
      widget: const ExplorePage(),
      iconData: Icons.explore_rounded,
    ),
    NavbarData(
      label: 'Menu',
      widget: const MenuPage(),
      iconData: Icons.menu_rounded,
    ),
  ];

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class NavbarData {
  NavbarData({this.widget, this.label, this.iconData});

  IconData? iconData;
  String? label;
  Widget? widget;
}
