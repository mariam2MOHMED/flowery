import 'package:flowerecommeric/feature/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../api/models/update_cart_quantity.dart';
import '../entities/cart_entity.dart';

@injectable
class UpdateCartQuantityUseCase {
  final CartRepo _cartRepo;
  const UpdateCartQuantityUseCase(this._cartRepo);
  Future<Result<CartEntity>>call(String id,UpdateCartQuantity updateQuantity)async{
    return await _cartRepo.updateQuantityCart(id, updateQuantity);
  }
}
