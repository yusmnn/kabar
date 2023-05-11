import 'package:flutter/material.dart';
import 'package:flutter_news_app/consts/list_keywords.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../consts/color.dart';
import '../../models/news_model.dart';
import '../../viewmodels/news_provider.dart';
import '../widgets/articles_widget.dart';
import '../widgets/domain_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late final TextEditingController domainController = TextEditingController();
  late List<NewsModel>? domainList = [];
  bool isDomain = false;

  @override
  void dispose() {
    if (mounted) {
      domainController.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    domainController;
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('All Platforms',
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          domainList!.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    domainController.clear();
                    isDomain = false;
                    domainList!.clear();
                    setState(() {});
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/close.svg',
                    width: 16,
                    height: 18,
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            //jika domainList kosong dan isDomain true
            if (!isDomain && domainList!.isEmpty)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: domainsKeywoards.keys.toList().map((index) {
                    final domain = domainsKeywoards[index]!;
                    return GestureDetector(
                      onTap: () async {
                        domainController.text = domain['url']!;
                        domainList = await newsProvider.sourceDomainProvider(
                          domain: domainController.text,
                        );
                        setState(() {});
                      },
                      child: DomainWidget(
                        title: domain['url']!,
                        image: domain['image']!,
                      ),
                    );
                  }).toList(),
                ),
              ),

            // jika sedang mencari dan list pencarian kosong
            if (isDomain && domainList!.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'Sorry! No news found',
                    style: TextStyle(
                      fontSize: 24,
                      color: grey1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

            //jika domainList tidak kosong (ada data)
            if (domainList != null && domainList!.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: domainList!.length,
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                      value: domainList![index],
                      child: const ArticlesWidget(),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
