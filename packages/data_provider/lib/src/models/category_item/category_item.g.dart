// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'children': instance.children?.map((e) => e.toJson()).toList(),
    };
