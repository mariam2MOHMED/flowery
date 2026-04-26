import 'package:equatable/equatable.dart';

import 'cart_item_entity.dart';

class CartProductEntity extends Equatable {
  final String? id;
  final String? user;
  final List<CartItemEntity>? cartItems;
  final List<dynamic>? appliedCoupons;
  final int? discount;
  final int? totalPrice;
  final int? totalPriceAfterDiscount;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  const CartProductEntity({
    this.id,
    this.user,
    this.cartItems,
    this.appliedCoupons,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @override
  List<Object?> get props => [
    id,
    user,
    cartItems,
    appliedCoupons,
    discount,
    totalPrice,
    totalPriceAfterDiscount,
    createdAt,
    updatedAt,
    v,
  ];
}