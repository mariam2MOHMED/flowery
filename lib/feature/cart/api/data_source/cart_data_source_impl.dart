import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/core/safe_api_call/safe_api_call.dart';
import 'package:flowerecommeric/feature/cart/api/client/cart_client.dart';

import 'package:flowerecommeric/feature/cart/api/models/add_product_cart_model.dart';

import 'package:flowerecommeric/feature/cart/domain/entities/cart_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/cart_data_source.dart';
import '../models/update_cart_quantity.dart';
@Injectable(as: CartDataSource)
class CartDataSourceImpl implements CartDataSource{
 final CartClientServices _cartClientServices;
 const CartDataSourceImpl(this._cartClientServices);
  @override
  Future<Result<CartEntity>> addToCart(AddProductCartModel cartModel) {
 return safeApiCall(()async{
   final cart=await _cartClientServices.addToCart(cartModel);
   return cart.toEntity();
 });
  }

  @override
  Future<Result<CartEntity>> deleteItemFromCart(String id) {
    return safeApiCall(()async{
      final cart=await _cartClientServices.deleteItemFromCart(id);
      return cart.toEntity();
    });
  }

  @override
  Future<Result<CartEntity>> getAllItemsToCart() {
    return safeApiCall(()async{
      final cart=await _cartClientServices.getAllItemsToCart();
      return cart.toEntity();
    });
  }

  @override
  Future<Result<CartEntity>> updateQuantityCart(String id,UpdateCartQuantity updateQuantity) {

      return safeApiCall(()async{
        final cart=await _cartClientServices.updateQuantityCart(id, updateQuantity);
        return cart.toEntity();
      });
  }


}
