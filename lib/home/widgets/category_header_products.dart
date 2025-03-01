import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/home/home.dart';

class CategoryHeaderProducts extends StatelessWidget {
  const CategoryHeaderProducts({
    required this.category,
    required this.products,
    super.key,
  });

  final List<ProductItem> products;
  final CategoryItem category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: CategoriesItemCard(category: category),
        ),
        SizedBox(
          height: 340,
          child: HorizontalProductList(products: products),
        ),
      ],
    );
  }
}
