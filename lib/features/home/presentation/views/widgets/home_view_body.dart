import 'package:flutter/material.dart';
import 'package:recpie_app/features/home/presentation/views/widgets/personalized_recipes_listener.dart';
import 'package:recpie_app/features/home/presentation/views/widgets/popular_recipes_section.dart';

import 'Healthy_recipes_section.dart';
import 'categories_recipes_section.dart';
import 'custom_home_app_bar.dart';
import 'easy_recipes_section.dart';
import 'highly_related_recipes_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomHomeAppBar(),
              Column(
                children: [
                  PersonalizedListener(),
                  PopularRecipesSection(),
                  CategoriesRecipesSection(),
                  HealthyRecipesSection(),
                  HighlyRelatedRecipesSection(),
                  EasyRecipesSection(),
                ],
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ],
    );
  }
}
