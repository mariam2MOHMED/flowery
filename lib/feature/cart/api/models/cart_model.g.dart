// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
  message: json['message'] as String?,
  numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
  cart: json['cart'] == null
      ? null
      : Cart.fromJson(json['cart'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
  'message': instance.message,
  'numOfCartItems': instance.numOfCartItems,
  'cart': instance.cart,
};

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  Id: json['_id'] as String?,
  user: json['user'] as String?,
  cartItems: (json['cartItems'] as List<dynamic>?)
      ?.map((e) => CartItems.fromJson(e as Map<String, dynamic>))
      .toList(),
  appliedCoupons: json['appliedCoupons'] as List<dynamic>?,
  discount: (json['discount'] as num?)?.toInt(),
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
  totalPriceAfterDiscount: (json['totalPriceAfterDiscount'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
);

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
  '_id': instance.Id,
  'user': instance.user,
  'cartItems': instance.cartItems,
  'appliedCoupons': instance.appliedCoupons,
  'discount': instance.discount,
  'totalPrice': instance.totalPrice,
  'totalPriceAfterDiscount': instance.totalPriceAfterDiscount,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
};

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
  product: json['product'] == null
      ? null
      : Product.fromJson(json['product'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  Id: json['_id'] as String?,
);

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
  'product': instance.product,
  'price': instance.price,
  'quantity': instance.quantity,
  '_id': instance.Id,
};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  Id: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  imgCover: json['imgCover'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  price: (json['price'] as num?)?.toInt(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  rateAvg: (json['rateAvg'] as num?)?.toInt(),
  rateCount: (json['rateCount'] as num?)?.toInt(),
  sold: (json['sold'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  category: json['category'] as String?,
  occasion: json['occasion'] as String?,
  isSuperAdmin: json['isSuperAdmin'] as bool?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  '_id': instance.Id,
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'imgCover': instance.imgCover,
  'images': instance.images,
  'price': instance.price,
  'priceAfterDiscount': instance.priceAfterDiscount,
  'discount': instance.discount,
  'rateAvg': instance.rateAvg,
  'rateCount': instance.rateCount,
  'sold': instance.sold,
  'quantity': instance.quantity,
  'category': instance.category,
  'occasion': instance.occasion,
  'isSuperAdmin': instance.isSuperAdmin,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
  'id': instance.id,
};
