import 'package:flowerecommeric/feature/cart/api/models/update_cart_quantity.dart';

import '../../api/models/add_product_cart_model.dart';

sealed class CartIntent{
  const CartIntent();
}
final class AddToCartIntent extends CartIntent{
  final AddProductCartModel cart;

  const AddToCartIntent({required this.cart});
}
final class UpdateCartQuantityIntent extends CartIntent{
  final UpdateCartQuantity quantity;
  final String id;
  const  UpdateCartQuantityIntent({required this.quantity,required this.id});
}
final class DeleteItemFromCartIntent extends CartIntent{
  final String id;
  const DeleteItemFromCartIntent({required this.id});
}
final class GetAllItemFromCartIntent extends CartIntent{
const  GetAllItemFromCartIntent();
}