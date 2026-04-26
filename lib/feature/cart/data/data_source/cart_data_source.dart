import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/feature/cart/domain/entities/cart_entity.dart';

import '../../api/models/add_product_cart_model.dart';
import '../../api/models/update_cart_quantity.dart';

abstract class CartDataSource{
  Future<Result<CartEntity>>addToCart( AddProductCartModel cart);
  Future<Result<CartEntity>> updateQuantityCart(String id,UpdateCartQuantity updateQuantity);

  Future<Result<CartEntity>>getAllItemsToCart();

  Future<Result<CartEntity>> deleteItemFromCart(
      String id);
}