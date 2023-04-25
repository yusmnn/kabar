import 'package:flutter/material.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail News Page'),
      ),
      body: const Center(
        child: Center(
          child: Text('Detail News Page'),
        ),
      ),
    );
  }
}
