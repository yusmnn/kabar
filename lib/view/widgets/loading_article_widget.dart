import 'package:flutter/material.dart';
import 'package:flutter_news_app/consts/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/color.dart';

class LoadingArticleWidget extends StatelessWidget {
  const LoadingArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Container(
      color: primaryColor,
      child: Column(
        children: [
          ListArticleLoading(size: size),
        ],
      ),
    );
  }
}

class ListArticleLoading extends StatelessWidget {
  const ListArticleLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: blue1,
        highlightColor: primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 10,
                        width: size.width * 1 / 3,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 40,
                        width: size.width * 0.6,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            height: 10,
                            width: size.width * 1 / 4,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: size.height * 0.12,
                    width: size.height * 0.12,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 10,
                        width: size.width * 1 / 3,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 40,
                        width: size.width * 0.6,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            height: 10,
                            width: size.width * 1 / 4,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: size.height * 0.12,
                    width: size.height * 0.12,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
