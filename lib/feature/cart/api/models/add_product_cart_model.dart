import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/add_product_cart_entity.dart';

part 'add_product_cart_model.g.dart';

@JsonSerializable()
class AddProductCartModel {
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "quantity")
  final int? quantity;

  AddProductCartModel ({
    this.product,
    this.quantity,
  });

  factory AddProductCartModel.fromJson(Map<String, dynamic> json) {
    return _$AddProductCartModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductCartModelToJson(this);
  }
  AddProductCartEntity toEntity(){
    return AddProductCartEntity(
      product: product,
      quantity: quantity
    );
  }
}


