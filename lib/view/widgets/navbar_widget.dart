import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navbar_provider.dart';
import '../pages/menu_page.dart';
import '../pages/explore_page.dart';
import '../pages/home_page.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      body: Consumer<NavbarProvider>(
        builder: (context, navbarProvider, child) {
          return IndexedStack(
            index: navbarProvider.selectedIndex,
            children: const [
              HomePage(),
              ExplorePage(),
              MenuPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<NavbarProvider>(
        builder: (context, value, child) => BottomNavigationBar(
          items: navbarProvider.items
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.iconData),
                  label: item.label,
                ),
              )
              .toList(),
          currentIndex: navbarProvider.selectedIndex,
          onTap: (index) => navbarProvider.selectedIndex = index,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
