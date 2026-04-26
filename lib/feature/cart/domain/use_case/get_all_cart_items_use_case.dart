import 'package:flowerecommeric/feature/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../entities/cart_entity.dart';

@injectable
class GetAllCartItemsUseCase {
  final CartRepo _cartRepo;
  const GetAllCartItemsUseCase(this._cartRepo);
  Future<Result<CartEntity>>call()async{
    return await _cartRepo.getAllItemsToCart();
  }
}
