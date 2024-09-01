import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/orders/orders.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const OrderListPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(
        orderRepository: context.read<OrderRepository>(),
      )..add(const OrdersRequested()),
      child: const OrderListView(),
    );
  }
}

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = context.select((OrderBloc bloc) => bloc.state.orders);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.orders),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.md),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          return OrderItemCard(order: orders[index]);
        },
      ),
    );
  }
}
