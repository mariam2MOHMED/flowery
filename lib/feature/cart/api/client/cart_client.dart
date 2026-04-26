import 'package:dio/dio.dart';
import 'package:flowerecommeric/core/constants/end_point_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_parameters.dart';
import '../models/add_product_cart_model.dart';
import '../models/cart_model.dart';
import '../models/update_cart_quantity.dart';
part 'cart_client.g.dart';
@RestApi()
@injectable
abstract class CartClientServices{
  @factoryMethod
  factory CartClientServices(Dio dio)=_CartClientServices;
@POST(ApiEndPoints.cartEndPoint)
  Future<CartModel>addToCart(@Body() AddProductCartModel cart);
  @PUT('${ApiEndPoints.cartEndPoint}/{id}')
  Future<CartModel> updateQuantityCart(
      @Path(ApiParameters.id) String id,
      @Body() UpdateCartQuantity updateQuantity,
      );
  @GET(ApiEndPoints.cartEndPoint)
  Future<CartModel>getAllItemsToCart();
  @DELETE(ApiEndPoints.cartEndPoint)
  Future<CartModel> deleteItemFromCart(
  @Path(ApiParameters.id) String id);
}