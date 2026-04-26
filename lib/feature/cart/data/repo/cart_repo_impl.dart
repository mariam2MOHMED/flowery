import 'package:flowerecommeric/core/result/result.dart';

import 'package:flowerecommeric/feature/cart/api/models/add_product_cart_model.dart';

import 'package:flowerecommeric/feature/cart/api/models/update_cart_quantity.dart';
import 'package:flowerecommeric/feature/cart/data/data_source/cart_data_source.dart';

import 'package:flowerecommeric/feature/cart/domain/entities/cart_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/cart_repo.dart';
@Injectable(as: CartRepo)
class CartRepoImpl implements  CartRepo{
  final CartDataSource _cartDataSource;
  const CartRepoImpl(this._cartDataSource);
  @override
  Future<Result<CartEntity>> addToCart(AddProductCartModel cart)async {
   return await _cartDataSource.addToCart(cart);
  }

  @override
  Future<Result<CartEntity>> deleteItemFromCart(String id) async{
    return await _cartDataSource.deleteItemFromCart(id);
  }

  @override
  Future<Result<CartEntity>> getAllItemsToCart() async{
    return await _cartDataSource.getAllItemsToCart();

  }

  @override
  Future<Result<CartEntity>> updateQuantityCart(String id, UpdateCartQuantity updateQuantity)async {
    return await _cartDataSource.updateQuantityCart(id, updateQuantity);
  }
  
}