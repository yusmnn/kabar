import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({
    super.key,
    required this.text,
    required this.color,
    required this.function,
    required this.fontSize,
  });

  final Color color;
  final double fontSize;
  final Function function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor: color.withOpacity(0.2),
      selectedColor: color,
      label: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
      onSelected: (bool value) {
        function();
      },
    );
  }
}

//!widget tabbar yang menggunakan filterchip
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       TabsWidget(
            //         text: 'All News',
            //         color: newsType == NewsType.allNews
            //             ? const Color(0xff1877F2)
            //             : const Color(0xff4E4B66),
            //         fontSize: newsType == NewsType.allNews ? 18 : 14,
            //         function: () {
            //           if (newsType == NewsType.allNews) {
            //             return;
            //           }
            //           setState(() {
            //             newsType = NewsType.allNews;
            //           });
            //         },
            //       ),
            //       const SizedBox(
            //         width: 16,
            //       ),
            //       TabsWidget(
            //         text: 'Crypto',
            //         color: newsType == NewsType.crypto
            //             ? const Color(0xff1877F2)
            //             : const Color(0xff4E4B66),
            //         fontSize: newsType == NewsType.crypto ? 16 : 14,
            //         function: () {
            //           if (newsType == NewsType.crypto) {
            //             return;
            //           }
            //           setState(() {
            //             newsType = NewsType.crypto;
            //           });
            //         },
            //       ),
            //       const SizedBox(
            //         width: 16,
            //       ),
            //       TabsWidget(
            //         text: 'Music',
            //         color: newsType == NewsType.music
            //             ? const Color(0xff1877F2)
            //             : const Color(0xff4E4B66),
            //         fontSize: newsType == NewsType.music ? 16 : 14,
            //         function: () {
            //           if (newsType == NewsType.music) {
            //             return;
            //           }
            //           setState(() {
            //             newsType = NewsType.music;
            //           });
            //         },
            //       ),
            //       const SizedBox(
            //         width: 16,
            //       ),
            //       TabsWidget(
            //         text: 'Sport',
            //         color: newsType == NewsType.sport
            //             ? const Color(0xff1877F2)
            //             : const Color(0xff4E4B66),
            //         fontSize: newsType == NewsType.sport ? 16 : 14,
            //         function: () {
            //           if (newsType == NewsType.sport) {
            //             return;
            //           }
            //           setState(() {
            //             newsType = NewsType.sport;
            //           });
            //         },
            //       ),
            //       const SizedBox(
            //         width: 16,
            //       ),
            //       TabsWidget(
            //         text: 'Tech',
            //         color: newsType == NewsType.tech
            //             ? const Color(0xff1877F2)
            //             : const Color(0xff4E4B66),
            //         fontSize: newsType == NewsType.tech ? 16 : 14,
            //         function: () {
            //           if (newsType == NewsType.tech) {
            //             return;
            //           }
            //           setState(() {
            //             newsType = NewsType.tech;
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            // ),
