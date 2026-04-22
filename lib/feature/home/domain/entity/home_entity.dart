import 'package:equatable/equatable.dart';
import 'package:flowerecommeric/feature/home/domain/entity/category_entity.dart';
import 'package:flowerecommeric/feature/home/domain/entity/product_entity.dart';

class HomeEntity extends Equatable {
  final String message;
  final List<ProductEntity> products;
  final List<CategoryEntity> categories;
  final List<ProductEntity> bestSeller;
  final List<CategoryEntity> occasions;

  const HomeEntity({
    required this.message,
    required this.products,
    required this.categories,
    required this.bestSeller,
    required this.occasions,
  });
  @override
  List<Object?> get props => [
    message,
    products,
    categories,
    bestSeller,
    occasions
  ];
}