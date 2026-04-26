import 'package:flowerecommeric/feature/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/cart_entity.dart';

@injectable
class DeleteCartItemUseCase {
  final CartRepo _cartRepo;
  const DeleteCartItemUseCase(this._cartRepo);
  Future<Result<CartEntity>>call(String id)async{
    return await _cartRepo.deleteItemFromCart(id);
  }
}
