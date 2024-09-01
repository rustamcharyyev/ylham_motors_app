// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';

class OrderItem {
  final int id;
  final String trackCode;
  final String createdAt;
  final String dateDelivery;
  final double totalPrice;
  final int productsAmount;
  final OrderStatus status;
  final List<ProductItem> products;

//<editor-fold desc="Data Methods">
  const OrderItem({
    required this.id,
    required this.trackCode,
    required this.createdAt,
    required this.dateDelivery,
    required this.totalPrice,
    required this.productsAmount,
    required this.status,
    required this.products,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          trackCode == other.trackCode &&
          createdAt == other.createdAt &&
          dateDelivery == other.dateDelivery &&
          totalPrice == other.totalPrice &&
          productsAmount == other.productsAmount &&
          status == other.status &&
          products == other.products);

  @override
  int get hashCode =>
      id.hashCode ^
      trackCode.hashCode ^
      createdAt.hashCode ^
      dateDelivery.hashCode ^
      totalPrice.hashCode ^
      productsAmount.hashCode ^
      status.hashCode ^
      products.hashCode;

  @override
  String toString() {
    return 'OrderItem{'
        ' id: $id,'
        ' trackCode: $trackCode,'
        ' createdAt: $createdAt,'
        ' dateDelivery: $dateDelivery,'
        ' totalPrice: $totalPrice,'
        ' productsAmount: $productsAmount,'
        ' status: $status,'
        ' products: $products, '
        '}';
  }

  OrderItem copyWith({
    int? id,
    String? trackCode,
    String? createdAt,
    String? dateDelivery,
    double? totalPrice,
    int? productsAmount,
    OrderStatus? status,
    List<ProductItem>? products,
  }) {
    return OrderItem(
      id: id ?? this.id,
      trackCode: trackCode ?? this.trackCode,
      createdAt: createdAt ?? this.createdAt,
      dateDelivery: dateDelivery ?? this.dateDelivery,
      totalPrice: totalPrice ?? this.totalPrice,
      productsAmount: productsAmount ?? this.productsAmount,
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'track_code': trackCode,
      'created_at': createdAt,
      'date_delivery': dateDelivery,
      'total_price': totalPrice,
      'products_amount': productsAmount,
      'status': status,
      'products': products,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'] as int,
      trackCode: map['track_code'] as String,
      createdAt: map['created_at'] as String,
      dateDelivery: map['date_delivery'] as String,
      totalPrice: double.parse(map['total_price'] as String),
      productsAmount: map['products_amount'] as int,
      status: OrderStatus.fromMap(map['status'] as Map<String, dynamic>),
      products: (map['products'] as List)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

//</editor-fold>
}
