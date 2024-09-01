import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/l10n/l10n.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({required this.order, super.key});

  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: ${order.id}'),
          Text(
            'STATUS: '
            '${order.status.name(context.l10n.localeName)}',
          ),
          Text('${context.l10n.totalCost}: ${order.totalPrice}'),
          Text('Product amount: ${order.productsAmount}'),
          SizedBox(
            height: 320,
            width: double.maxFinite,
            child: HorizontalProductList(products: order.products),
          ),
          Text('Created at: ${order.createdAt}'),
        ],
      ),
    );
  }
}
