import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color.dart';
import '../../consts/vars.dart';
import '../../services/utils.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).screenSize;
    late final TextEditingController searchController = TextEditingController();
    late final FocusNode searchFocusNode = FocusNode();

    @override
    void initState() {
      super.initState();
      searchController;
      searchFocusNode;
    }

    @override
    void dispose() {
      if (mounted) {
        searchController.dispose();
        searchFocusNode.dispose();
      }
      super.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 18,
                      height: 21.5,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        grey1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ), // iko
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none, // menghilangkan border
                        suffixIcon: IconButton(
                          onPressed: () {
                            searchController.clear();
                            FocusScope.of(context).unfocus();
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
                        hintText: 'Search',
                      ),
                      focusNode: searchFocusNode,
                      controller: searchController,
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      onEditingComplete: () {},
                      // placeholder teks
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: MasonryGridView.count(
                  itemCount: searchKeywords.length,
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
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
                          child: Text(
                            searchKeywords[index],
                          ),
                        ),
                      ),
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
