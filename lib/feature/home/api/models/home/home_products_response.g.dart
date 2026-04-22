// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProductsResponse _$HomeProductsResponseFromJson(
  Map<String, dynamic> json,
) => HomeProductsResponse(
  message: json['message'] as String?,
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
      .toList(),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
      .toList(),
  bestSeller: (json['bestSeller'] as List<dynamic>?)
      ?.map((e) => BestSeller.fromJson(e as Map<String, dynamic>))
      .toList(),
  occasions: (json['occasions'] as List<dynamic>?)
      ?.map((e) => Occasions.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeProductsResponseToJson(
  HomeProductsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'products': instance.products,
  'categories': instance.categories,
  'bestSeller': instance.bestSeller,
  'occasions': instance.occasions,
};

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
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

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
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

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
  Id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
  isSuperAdmin: json['isSuperAdmin'] as bool?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'isSuperAdmin': instance.isSuperAdmin,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

BestSeller _$BestSellerFromJson(Map<String, dynamic> json) => BestSeller(
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

Map<String, dynamic> _$BestSellerToJson(BestSeller instance) =>
    <String, dynamic>{
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

Occasions _$OccasionsFromJson(Map<String, dynamic> json) => Occasions(
  Id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
  isSuperAdmin: json['isSuperAdmin'] as bool?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$OccasionsToJson(Occasions instance) => <String, dynamic>{
  '_id': instance.Id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
  'isSuperAdmin': instance.isSuperAdmin,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
