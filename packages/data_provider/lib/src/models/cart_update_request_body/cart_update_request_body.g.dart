// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_update_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartUpdateRequestBody _$CartUpdateRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CartUpdateRequestBody(
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartUpdateRequestBodyToJson(
        CartUpdateRequestBody instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
    };
