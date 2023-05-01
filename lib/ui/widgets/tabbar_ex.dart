import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Tab 1'),
    const Tab(text: 'Tab 2'),
    const Tab(text: 'Tab 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar Widget'),
          bottom: TabBar(
            tabs: myTabs,
            unselectedLabelColor:
                Colors.black, // warna label yang tidak dipilih
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            final String label = tab.text!.toLowerCase();
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 16),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
