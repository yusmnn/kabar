import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/color.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Container(
      color: backgroundColor,
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
      child: InkWell(
        onTap: () {},
        child: Shimmer.fromColors(
          baseColor: blue1,
          highlightColor: backgroundColor,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: size.height * 0.12,
                  width: size.height * 0.12,
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: size.width * 0.6,
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
                          height: 10,
                          width: size.width * 1 / 5,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        Container(
                          height: 10,
                          width: size.width * 1 / 5,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
