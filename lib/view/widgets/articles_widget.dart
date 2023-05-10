import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/consts/color.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../consts/utils.dart';
import '../../services/error_dialog.dart';
import '../pages/news_detail_webview_page.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).screenSize;

    final newsModelProvider = Provider.of<NewsModel>(context, listen: false);
    return Container(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NewsDetailPage(
                  url: newsModelProvider.url,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsModelProvider.dateToShow,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          newsModelProvider.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          newsModelProvider.sourceName,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FancyShimmerImage(
                      height: size.height * 0.12,
                      width: size.height * 0.12,
                      boxFit: BoxFit.fill,
                      imageUrl: newsModelProvider.urlToImage,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: InkWell(
                  onTap: () async {
                    try {
                      await Share.share(
                        newsModelProvider.url,
                        subject: 'Udah baca berita ini? Cek yuk!',
                      );
                    } catch (e) {
                      errorDialog(
                        errorMessage: e.toString(),
                        context: context,
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      'assets/icons/share.svg',
                      width: 24,
                      height: 24,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        grey1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
