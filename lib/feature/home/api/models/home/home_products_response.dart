import 'package:flowerecommeric/feature/home/domain/entity/category_entity.dart';
import 'package:flowerecommeric/feature/home/domain/entity/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/home_entity.dart';

part 'home_products_response.g.dart';

@JsonSerializable()
class HomeProductsResponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'products')
  final List<Products>? products;
  @JsonKey(name: 'categories')
  final List<Categories>? categories;
  @JsonKey(name: 'bestSeller')
  final List<BestSeller>? bestSeller;
  @JsonKey(name: 'occasions')
  final List<Occasions>? occasions;

  HomeProductsResponse ({
    this.message,
    this.products,
    this.categories,
    this.bestSeller,
    this.occasions,
  });

  factory HomeProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$HomeProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeProductsResponseToJson(this);
  }
  HomeEntity toEntity(){
    return HomeEntity
      (
      message: message!,
      products: products?.map((e) => e.toEntity()).toList() ?? [],
      categories: categories?.map((e) => e.toEntity()).toList() ?? [],
      bestSeller: bestSeller?.map((e) => e.toEntity()).toList() ?? [],
      occasions: occasions?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class Products {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'imgCover')
  final String? imgCover;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'priceAfterDiscount')
  final int? priceAfterDiscount;
  @JsonKey(name: 'discount')
  final int? discount;
  @JsonKey(name: 'rateAvg')
  final int? rateAvg;
  @JsonKey(name: 'rateCount')
  final int? rateCount;
  @JsonKey(name: 'sold')
  final int? sold;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'occasion')
  final String? occasion;
  @JsonKey(name: 'isSuperAdmin')
  final bool? isSuperAdmin;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  @JsonKey(name: 'id')
  final String? id;

  Products ({
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

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsToJson(this);
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

@JsonSerializable()
class Categories {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'isSuperAdmin')
  final bool? isSuperAdmin;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  Categories ({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.isSuperAdmin,
    this.createdAt,
    this.updatedAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return _$CategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesToJson(this);
  }
  CategoryEntity toEntity(){
    return CategoryEntity(
        image: image,
        id: Id,
        name: name,
        slug: slug,
        isSuperAdmin: isSuperAdmin,
        createdAt: createdAt,
        updatedAt: updatedAt
    );
  }
}

@JsonSerializable()
class BestSeller {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'imgCover')
  final String? imgCover;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'priceAfterDiscount')
  final int? priceAfterDiscount;
  @JsonKey(name: 'discount')
  final int? discount;
  @JsonKey(name: 'rateAvg')
  final int? rateAvg;
  @JsonKey(name: 'rateCount')
  final int? rateCount;
  @JsonKey(name: 'sold')
  final int? sold;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'occasion')
  final String? occasion;
  @JsonKey(name: 'isSuperAdmin')
  final bool? isSuperAdmin;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  @JsonKey(name: 'id')
  final String? id;

  BestSeller ({
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

  factory BestSeller.fromJson(Map<String, dynamic> json) {
    return _$BestSellerFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BestSellerToJson(this);
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

@JsonSerializable()
class Occasions {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'isSuperAdmin')
  final bool? isSuperAdmin;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  Occasions ({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.isSuperAdmin,
    this.createdAt,
    this.updatedAt,
  });

  factory Occasions.fromJson(Map<String, dynamic> json) {
    return _$OccasionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsToJson(this);
  }
  CategoryEntity toEntity(){
    return CategoryEntity(
      image: image,
      id: Id,
      name: name,
      slug: slug,
      isSuperAdmin: isSuperAdmin,
      createdAt: createdAt,
      updatedAt: updatedAt
    );
  }
}


