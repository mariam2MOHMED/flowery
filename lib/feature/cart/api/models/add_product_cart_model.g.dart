// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductCartModel _$AddProductCartModelFromJson(Map<String, dynamic> json) =>
    AddProductCartModel(
      product: json['product'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddProductCartModelToJson(
  AddProductCartModel instance,
) => <String, dynamic>{
  'product': instance.product,
  'quantity': instance.quantity,
};
