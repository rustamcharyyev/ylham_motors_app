// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

enum OrderStatus {
  initial,
  loading,
  populated,
  failure,
}

final class OrderState extends Equatable {
  const OrderState({
    required this.status,
    this.orders = const [],
  });

  const OrderState.initial() : this(status: OrderStatus.initial);

  final OrderStatus status;
  final List<OrderItem> orders;

  @override
  List<Object> get props => [
        status,
        orders,
      ];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderItem>? orders,
  }) {
    return OrderState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
    );
  }
}
