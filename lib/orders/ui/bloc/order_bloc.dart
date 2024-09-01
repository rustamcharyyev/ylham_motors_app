import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:ylham_motors/orders/data/data.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc({
    required OrderRepository orderRepository,
  })  : _orderRepository = orderRepository,
        super(const OrderState.initial()) {
    on<OrdersRequested>(_onOrdersRequested);
  }

  final OrderRepository _orderRepository;

  FutureOr<void> _onOrdersRequested(
    OrdersRequested event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final response = await _orderRepository.getOrders();
      emit(state.copyWith(
        status: OrderStatus.populated,
        orders: response.data,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: OrderStatus.initial));
      addError(error, stackTrace);
    }
  }
}
