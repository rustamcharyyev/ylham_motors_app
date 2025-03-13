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
          Text('${context.l10n.orderId}: ${order.id}'),
          Text(
            '${context.l10n.orderStatus}: '
            '${order.status.name(context.l10n.localeName)}',
          ),
          Text('${context.l10n.totalCost}: ${order.totalPrice}'),
          Text('${context.l10n.productAmount}: ${order.productsAmount}'),
          SizedBox(
            height: 340,
            width: double.maxFinite,
            child: HorizontalProductList(products: order.products),
          ),
          Text('${context.l10n.createdAt}: ${order.createdAt}'),
        ],
      ),
    );
  }
}
