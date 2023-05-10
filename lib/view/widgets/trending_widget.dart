import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/consts/color.dart';
import 'package:provider/provider.dart';

import '../../models/news_model.dart';
import '../../consts/utils.dart';
import '../pages/news_detail_webview_page.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).screenSize;
    final newsModelProvider = Provider.of<NewsModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsDetailPage(
                url: url,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: FancyShimmerImage(
                  imageUrl: newsModelProvider.urlToImage,
                  height: size.height * 0.30,
                  width: size.width,
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      newsModelProvider.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          newsModelProvider.dateToShow,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          newsModelProvider.sourceName,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodySmall,
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
