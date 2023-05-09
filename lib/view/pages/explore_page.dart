import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../consts/color.dart';

import '../../consts/list_keywords.dart';
import '../../viewmodels/news_provider.dart';
import '../widgets/articles_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool isSearching = false;
  late final TextEditingController searchController = TextEditingController();
  late final FocusNode searchFocusNode = FocusNode();
  List<NewsModel>? searchList = [];

  @override
  void dispose() {
    if (mounted) {
      searchController.dispose();
      searchFocusNode.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    searchController;
    searchFocusNode;
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: TextField(
                cursorColor: grey1,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: grey1,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: grey1,
                        width: 1,
                      ),
                    ),
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 18,
                      height: 21.5,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        grey1,
                        BlendMode.srcIn,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                        searchFocusNode.unfocus();
                        isSearching = false;
                        searchList!.clear();
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
                    focusColor: grey1,
                    hintText: 'Find News here ...',
                    hintStyle: Theme.of(context).textTheme.bodyMedium),
                focusNode: searchFocusNode,
                controller: searchController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                onEditingComplete: () async {
                  searchList = await newsProvider.searchNewsProvider(
                    query: searchController.text,
                  );
                  isSearching = true;
                  searchFocusNode.unfocus();
                  setState(() {});
                },
                // placeholder teks
              ),
            ),
            if (!isSearching && searchList!.isEmpty)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: MasonryGridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchKeywords.length,
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          searchController.text = searchKeywords[index];
                          searchList = await newsProvider.searchNewsProvider(
                            query: searchController.text,
                          );
                          isSearching = true;
                          searchFocusNode.unfocus();
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: grey1,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                searchKeywords[index],
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            if (isSearching && searchList!.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'Sorry! No news found',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            if (searchList != null && searchList!.isNotEmpty)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListView.builder(
                    itemCount: searchList!.length,
                    itemBuilder: (ctx, index) {
                      return ChangeNotifierProvider.value(
                        value: searchList![index],
                        child: const ArticlesWidget(),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
