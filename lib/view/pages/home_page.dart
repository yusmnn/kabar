import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/providers/news_provider.dart';
import 'package:flutter_news_app/view/widgets/articles_widget.dart';
import 'package:flutter_news_app/view/widgets/loading_article_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../providers/navbar_provider.dart';
import '../widgets/loading_trending_widget.dart';
import '../widgets/trending_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(
            'assets/icons/icon_app.svg',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('Trending',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 350,
                    child: FutureBuilder<List<NewsModel>>(
                      future: newsProvider.fetchTopHeadlines(),
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: LoadingTrendingWidget(),
                          );
                        } else if (snapshot.hasError || snapshot.data == null) {
                          return const Center(
                            child: Text(
                                'Sorry, something went wrong. Please try again later...'),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return Consumer<NewsProvider>(
                            builder: (ctx, news, _) => Swiper(
                              autoplay: true,
                              autoplayDelay: 5000,
                              itemCount: 5,
                              viewportFraction: 0.9,
                              layout: SwiperLayout.DEFAULT,
                              axisDirection: AxisDirection.right,
                              itemBuilder: (context, index) {
                                return ChangeNotifierProvider.value(
                                  value: snapshot.data![index],
                                  child: TrendingWidget(
                                    url: snapshot.data![index].url,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return const Center(
                          child: Text(
                              'Sorry, something went wrong. Please try again later...'),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breaking News',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<NavbarProvider>(context, listen: false)
                          .selectedIndex = 1;
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              FutureBuilder<List<NewsModel>>(
                future: newsProvider.fetchAllNews(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingArticleWidget(),
                    );
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                      child: Text(
                          'Sorry, something went wrong. Please try again later...'),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) {
                        return Consumer<NewsProvider>(
                          builder: (ctx, news, _) =>
                              ChangeNotifierProvider.value(
                            value: snapshot.data![index],
                            child: const ArticlesWidget(),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text(
                        'Sorry, something went wrong. Please try again later...'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
