import '../../../../core/result/result.dart';
import '../../api/models/add_product_cart_model.dart';
import '../../api/models/update_cart_quantity.dart';
import '../entities/cart_entity.dart';

abstract class CartRepo{
  Future<Result<CartEntity>>addToCart( AddProductCartModel cart);
  Future<Result<CartEntity>> updateQuantityCart(String id,UpdateCartQuantity updateQuantity);

  Future<Result<CartEntity>>getAllItemsToCart();

  Future<Result<CartEntity>> deleteItemFromCart(
      String id);
}