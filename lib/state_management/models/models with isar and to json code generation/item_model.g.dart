// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 1,
      measurementUnit: json['measurementUnit'] as String? ?? "шт",
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0,
      date: DateTime.parse(json['date'] as String),
      isPurchase: json['isPurchase'] as bool? ?? true,
      isBlueprint: json['isBlueprint'] as bool? ?? false,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'measurementUnit': instance.measurementUnit,
      'totalAmount': instance.totalAmount,
      'date': instance.date.toIso8601String(),
      'isPurchase': instance.isPurchase,
      'isBlueprint': instance.isBlueprint,
    };
