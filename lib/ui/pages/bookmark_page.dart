import 'package:flutter/material.dart';

import '../../consts/color.dart';
import '../widgets/articles_widget.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Bookmark',
          style: TextStyle(
            fontSize: 32,
            color: grey1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      //! get api untuk bookmark nantinya
      //! buat empty screen untuk menandakan bahawa belum ada berita yang di bookmark
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (ctx, index) {
            return const ArticlesWidget();
          },
        ),
      ),
    );
  }
}
