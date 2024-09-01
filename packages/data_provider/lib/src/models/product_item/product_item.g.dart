// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as String?,
      count: (json['count'] as num?)?.toInt(),
      rating: json['rating'] as String?,
      category: json['category'] == null
          ? null
          : CategoryItem.fromJson(json['category'] as Map<String, dynamic>),
      discount: (json['discount'] as num?)?.toDouble(),
      discountedPrice: json['discounted_price'],
      action: json['action'] as bool?,
      actionText: json['action_text'] as String?,
      proportionalPrice: json['proportional_price'],
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'images': instance.images,
      'price': instance.price,
      'count': instance.count,
      'rating': instance.rating,
      'category': instance.category?.toJson(),
      'discount': instance.discount,
      'discounted_price': instance.discountedPrice,
      'action': instance.action,
      'action_text': instance.actionText,
      'proportional_price': instance.proportionalPrice,
      'isFavorite': instance.isFavorite,
    };
