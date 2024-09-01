part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

final class OrdersRequested extends OrderEvent {
  const OrdersRequested();
}
