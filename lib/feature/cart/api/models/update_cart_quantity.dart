import 'package:json_annotation/json_annotation.dart';

part 'update_cart_quantity.g.dart';

@JsonSerializable()
class UpdateCartQuantity {
  @JsonKey(name: "quantity")
  final int? quantity;

  UpdateCartQuantity ({
    this.quantity,
  });

  factory UpdateCartQuantity.fromJson(Map<String, dynamic> json) {
    return _$UpdateCartQuantityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateCartQuantityToJson(this);
  }

}


