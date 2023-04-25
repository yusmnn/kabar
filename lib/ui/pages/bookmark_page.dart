import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark Page'),
      ),
      body: const Center(
        child: Text('Bookmark Page'),
      ),
    );
  }
}
