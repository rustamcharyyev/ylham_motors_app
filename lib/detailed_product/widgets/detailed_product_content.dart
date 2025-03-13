import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/detailed_product/detailed_product.dart';
import 'package:ylham_motors/favorites/favorites.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/products/products.dart';

class DetailedProductContent extends StatefulWidget {
  const DetailedProductContent({super.key});

  @override
  State<DetailedProductContent> createState() => _DetailedProductContentState();
}

class _DetailedProductContentState extends State<DetailedProductContent> {
  int _current = 0;

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final product = context.read<DetailedProductCubit>().product;
    final categories = context.select((HomeBloc bloc) => bloc.state.categories);
    final categoryProducts =
        context.select((HomeBloc bloc) => bloc.state.categoryProducts);

    final category = categories.firstWhere(
      (element) => element.id == product.category?.id,
    );
    final products = categoryProducts[category.id];

    final properties = [
      // if (product.id != null) ('id', product.id),
      // if (product.rating != null) ('rating', product.rating),
      if (product.proportionalPrice != null)
        (context.l10n.proportionalPrice, product.proportionalPrice),
      if (product.discountedPrice != null)
        (context.l10n.discountedPrice, product.discountedPrice),
    ];

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(AppSpacing.md),
              ),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(AppSpacing.md),
                child: product.images != null &&
                        product.images!.isNotEmpty &&
                        product.images!.length > 1
                    ? CarouselSlider(
                        items: product.images!
                            .map(
                              (e) => CachedNetworkImage(
                                imageUrl: e,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder: (_, __, progress) =>
                                    Center(
                                  child: CircularProgressIndicator(
                                      value: progress.progress),
                                ),
                                errorWidget: (_, __, ___) =>
                                    const Icon(Icons.error),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: false,
                          // aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                          viewportFraction: 1.0, // Full width images
                          enableInfiniteScroll: true, // Infinite scroll
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: product.image ?? '',
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (_, __, progress) => Center(
                          child: CircularProgressIndicator(
                              value: progress.progress),
                        ),
                        errorWidget: (_, __, ___) => const Icon(Icons.error),
                      ),
              ),
            ),

            if (product.images != null && product.images!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: product.images!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),

            const SizedBox(height: AppSpacing.md),

            /// NAME
            Text(
              product.name ?? '',
              style: const AppTextStyle.text().lg().bold(),
            ),

            /// DESCRIPTION
            HtmlWidget(
              product.description ?? '',
            ),

            const SizedBox(height: AppSpacing.md),

            /// Price & actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    product.discountedPrice ?? product.price ?? '',
                    style: const AppTextStyle.text().lg().bold(),
                  ),
                ),

                /// Actions
                Expanded(
                  flex: 10,
                  child: ProductActionButtons(
                    productId: product.id!,
                    quantity: context.select(
                        (CartBloc bloc) => bloc.getProductQuantity(product.id)),
                    onFavoritePressed: () => context
                        .read<FavoritesBloc>()
                        .add(FavoriteButtonPressed(product)),
                    onQuantityUpdated: (quantity) {
                      context.read<CartBloc>().add(
                            CartUpdateRequested(
                              CartUpdateRequestBody(
                                productId: product.id!,
                                quantity: quantity,
                              ),
                            ),
                          );
                    },
                  ),
                  // child: ProductFooter(
                  //   onCart: () {},
                  //   onLike: () {},
                  // ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),

            /// Properties
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.md),
              clipBehavior: Clip.hardEdge,
              child: ColoredBox(
                color: Colors.blueGrey.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: properties.length,
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.white),
                    itemBuilder: (context, index) {
                      final (String key, dynamic value) = properties[index];

                      return Row(
                        children: [
                          Expanded(
                            flex: 50,
                            child: Text(
                              key,
                              style: const AppTextStyle.text().xs().semiBold(),
                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Text(
                              value.toString(),
                              style: const AppTextStyle.text().xs(),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),

            ///GAP
            const SizedBox(height: AppSpacing.lg),

            if (products != null && products.isNotEmpty)
              CategoryHeaderProducts(category: category, products: products),

            ///GAP
            if (products != null && products.isNotEmpty)
              const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}
