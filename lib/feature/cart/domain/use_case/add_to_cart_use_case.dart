import 'package:flowerecommeric/feature/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/models/add_product_cart_model.dart';
import '../entities/cart_entity.dart';

@injectable
class AddToCartUseCase {
  final CartRepo _cartRepo;
  const AddToCartUseCase(this._cartRepo);
  Future<Result<CartEntity>>call( AddProductCartModel cart)async{
    return await _cartRepo.addToCart(cart);
  }
}
