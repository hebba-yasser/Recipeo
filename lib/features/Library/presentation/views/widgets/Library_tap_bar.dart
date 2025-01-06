import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';

class LibraryTapBar extends StatelessWidget {
  const LibraryTapBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        child: Center(
          child: TabBar(
            controller: tabController,
            unselectedLabelStyle: AppFonts.bodyText16.copyWith(
              fontWeight: FontWeight.bold,
            ),
            labelStyle: AppFonts.bodyText16.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            indicatorColor: Colors.transparent,
            labelPadding: const EdgeInsets.all(0),
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.transparent,
            isScrollable: false,
            tabAlignment: TabAlignment.center,
            physics: const BouncingScrollPhysics(),
            tabs: [
              Tab(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 12,
                  decoration: BoxDecoration(
                    color: tabController.index == 0
                        ? kprimaryColor // Selected color
                        : AppColors.cream,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Liked',
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 12,
                  decoration: BoxDecoration(
                    color: tabController.index == 1
                        ? kprimaryColor // Selected color
                        : AppColors.cream,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Collections',
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
