import 'package:equatable/equatable.dart';

import '../../../home/domain/entity/product_entity.dart';

class CartEntity extends Equatable{

  final String message;
  final int numOfCartItems;
  final List<ProductEntity> cart;


  const CartEntity({
    required this.message,
    required this.cart,
    required this.numOfCartItems,

  });
  @override
  List<Object?> get props => [
    message,
   cart,
    numOfCartItems
  ];

}