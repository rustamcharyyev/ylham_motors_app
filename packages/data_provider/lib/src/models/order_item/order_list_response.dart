// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';

class OrderListResponse {
  final List<OrderItem> data;

//<editor-fold desc="Data Methods">
  const OrderListResponse({
    required this.data,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderListResponse &&
          runtimeType == other.runtimeType &&
          data == other.data);

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() {
    return 'OrderListResponse{ data: $data,}';
  }

  OrderListResponse copyWith({
    List<OrderItem>? data,
  }) {
    return OrderListResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
    };
  }

  factory OrderListResponse.fromMap(Map<String, dynamic> map) {
    return OrderListResponse(
      data: (map['data'] as List)
          .map((e) => OrderItem.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

//</editor-fold>
}
