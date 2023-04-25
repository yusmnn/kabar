import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navbar_provider.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      body: navbarProvider.items[navbarProvider.selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
