import 'package:flutter/material.dart';
import 'package:flutter_news_app/ui/pages/bookmark_page.dart';
import 'package:flutter_news_app/ui/pages/explore_page.dart';
import 'package:flutter_news_app/ui/pages/home_page.dart';

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
      iconData: Icons.explore_sharp,
    ),
    NavbarData(
      label: 'Bookmark',
      widget: const BookmarkPage(),
      iconData: Icons.bookmark_rounded,
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
