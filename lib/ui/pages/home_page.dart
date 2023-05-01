import 'package:flutter/material.dart';
import 'package:flutter_news_app/consts/vars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../consts/color.dart';
import '../../providers/navbar_provider.dart';
import '../widgets/articles_widget.dart';
import '../widgets/trending_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newsType = NewsType.allNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(
            'assets/icons/icon_app.svg',
          ),
        ),
        actions: [
          //! ganti disini jadi drawer untuk profile
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 18,
              height: 21.5,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                grey1,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
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
                  child: const Text(
                    'Trending',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 340,
                  child: TrendingWidget(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'breaking News',
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
            if (newsType == NewsType.allNews)
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (ctx, index) {
                    return const ArticlesWidget();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
