// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCreateRequestBody _$OrderCreateRequestBodyFromJson(
        Map<String, dynamic> json) =>
    OrderCreateRequestBody(
      fullName: json['full_name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      note: json['note'] as String?,
      paymentMethod: json['payment_method'] as String?,
      deliveryType: json['delivery_type'] as String?,
    );

Map<String, dynamic> _$OrderCreateRequestBodyToJson(
        OrderCreateRequestBody instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone': instance.phone,
      'address': instance.address,
      'note': instance.note,
      'payment_method': instance.paymentMethod,
      'delivery_type': instance.deliveryType,
    };
