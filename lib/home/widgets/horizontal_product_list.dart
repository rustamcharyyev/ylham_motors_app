import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors/detailed_product/detailed_product.dart';
import 'package:ylham_motors/products/products.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({required this.products, super.key});

  final List<ProductItem> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.md),
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
      itemBuilder: (context, index) {
        final product = products[index];
        return AspectRatio(
          aspectRatio: 180 / 340,
          child: ProductCard(
            product: product,
            onPressed: () => Navigator.of(context).push(
              DetailedProductPage.route(
                product: product,
              ),
            ),
          ),
        );
      },
    );
  }
}
