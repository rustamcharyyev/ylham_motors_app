import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/masters/masters.dart';
import 'package:ylham_motors/slider/slider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final appSource = context.select((AppCubit cubit) => cubit.state.appSource);
    final sliders = context.select((HomeBloc bloc) => bloc.state.sliders);
    final categories = context.select((HomeBloc bloc) => bloc.state.categories);
    final categoryProducts =
        context.select((HomeBloc bloc) => bloc.state.categoryProducts);
    final isLoading = context
        .select((HomeBloc bloc) => bloc.state.status == HomeStatus.loading);

    final categoryWidgets = categories.map((category) {
      final products = categoryProducts[category.id!];

      if (products == null || products.isEmpty) {
        return const SliverPadding(padding: EdgeInsets.zero);
      }

      return SliverToBoxAdapter(
        child: CategoryHeaderProducts(
          category: category,
          products: products,
        ),
      );
    });

    return CustomScrollView(
      slivers: [
        if (sliders.isNotEmpty)
          SliverToBoxAdapter(
            child: BannerAdsSlider(
              imageUrls: sliders.map<String?>((e) => e.image).nonNulls,
            ),
          )
        else
          const SliverToBoxAdapter(
            child: SizedBox(height: AppSpacing.md),
          ),

        /// Store products
        if (appSource == AppSource.store) ...[
          if (isLoading)
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: AppSpacing.md),
                  CircularProgressIndicator(),
                ],
              ),
            ),

          /// Category products
          ...categoryWidgets,

          // ProductGrid(
          //   productsLength: 10,
          //   onPressed: () {
          //     Navigator.of(context).push(DetailedProductPage.route());
          //   },
          // ),
        ],

        /// Masters
        if (appSource == AppSource.masters) ...[
          const MastersListView.sliver(),
        ],
      ],
    );
  }
}
