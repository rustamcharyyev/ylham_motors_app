import 'package:flutter/material.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/l10n/l10n.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriesView();
  }
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.category),
          bottom: TabBar(
            tabs: [
              // Tab(icon: PhosphorIcon(PhosphorIconsBold.circlesFour)),
              Tab(text: context.l10n.categories),
              Tab(text: context.l10n.brands),
            ],
          ),
        ),
        body: const CategoriesContent(),
      ),
    );
  }
}
