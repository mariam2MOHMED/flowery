import 'package:flowerecommeric/feature/cart/domain/entities/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../home/domain/entity/product_entity.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/cart_product_entity.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'numOfCartItems')
  final int? numOfCartItems;
  @JsonKey(name: 'cart')
  final Cart? cart;

  CartModel ({
    this.message,
    this.numOfCartItems,
    this.cart,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return _$CartModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartModelToJson(this);
  }
  CartEntity toEntity(){
    return CartEntity(
      message: message!,
        cart: cart?.cartItems
        ?.map((item) => item.product?.toEntity())
        .whereType<ProductEntity>()
        .toList() ??
        [],
        numOfCartItems: numOfCartItems!
    );
  }
}

@JsonSerializable()
class Cart {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "cartItems")
  final List<CartItems>? cartItems;
  @JsonKey(name: "appliedCoupons")
  final List<dynamic>? appliedCoupons;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "totalPriceAfterDiscount")
  final int? totalPriceAfterDiscount;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  Cart ({
    this.Id,
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

  factory Cart.fromJson(Map<String, dynamic> json) {
    return _$CartFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartToJson(this);
  }
  CartProductEntity toEntity() {
    return CartProductEntity(
      id: Id,
      user: user,
      cartItems: cartItems?.map((item) => item.toEntity()).toList(),
      appliedCoupons: appliedCoupons,
      discount: discount,
      totalPrice: totalPrice,
      totalPriceAfterDiscount: totalPriceAfterDiscount,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
    );
  }
}

@JsonSerializable()
class CartItems {
  @JsonKey(name: "product")
  final Product? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? Id;

  CartItems ({
    this.product,
    this.price,
    this.quantity,
    this.Id,
  });

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return _$CartItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemsToJson(this);
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      product: product?.toEntity(),
      price: price,
      quantity: quantity,
      id: Id,
    );
  }
}

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imgCover")
  final String? imgCover;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "rateAvg")
  final int? rateAvg;
  @JsonKey(name: "rateCount")
  final int? rateCount;
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "occasion")
  final String? occasion;
  @JsonKey(name: "isSuperAdmin")
  final bool? isSuperAdmin;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "id")
  final String? id;

  Product ({
    this.Id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.discount,
    this.rateAvg,
    this.rateCount,
    this.sold,
    this.quantity,
    this.category,
    this.occasion,
    this.isSuperAdmin,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
  ProductEntity toEntity(){
    return ProductEntity(

        id: id,
        images: images,
        updatedAt: updatedAt,
        createdAt: createdAt,
        category: category,
        isSuperAdmin: isSuperAdmin,
        slug: slug,
        sold: sold,
        occasion: occasion,
        rateAvg: rateAvg,
        rateCount: rateCount,
        title: title,
        description:description ,
        discount:discount ,
        imgCover:imgCover ,
        price:price ,
        priceAfterDiscount:priceAfterDiscount ,
        quantity: quantity
    );
  }
}


