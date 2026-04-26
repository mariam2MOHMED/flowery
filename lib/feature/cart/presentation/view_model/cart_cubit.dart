import 'package:flowerecommeric/core/errors/response_exceptions.dart';
import 'package:flowerecommeric/core/result/result.dart';
import 'package:flowerecommeric/core/state_status/state_status.dart';
import 'package:flowerecommeric/feature/cart/api/models/add_product_cart_model.dart';
import 'package:flowerecommeric/feature/cart/domain/entities/cart_entity.dart';
import 'package:flowerecommeric/feature/cart/domain/use_case/add_to_cart_use_case.dart';
import 'package:flowerecommeric/feature/cart/domain/use_case/get_all_cart_items_use_case.dart';
import 'package:flowerecommeric/feature/cart/domain/use_case/update_cart_quantity_use_case.dart';
import 'package:flowerecommeric/feature/cart/presentation/view_model/cart_intent.dart';
import 'package:flowerecommeric/feature/cart/presentation/view_model/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../api/models/update_cart_quantity.dart';
import '../../domain/use_case/delete_cart_item_use_case.dart';
@injectable
class CartCubit extends Cubit<CartState>{
  final AddToCartUseCase _addToCartUseCase;
  final UpdateCartQuantityUseCase _updateCartQuantityUseCase;
  final DeleteCartItemUseCase _deleteItemFromCartUseCase;
  final GetAllCartItemsUseCase _getAllCartItemsUseCase;

   CartCubit(this._addToCartUseCase,this._updateCartQuantityUseCase,this._deleteItemFromCartUseCase
      ,this._getAllCartItemsUseCase):super(const CartState());
  Future<void>doIntent({required CartIntent intent})async{
    switch(intent){

      case AddToCartIntent():
        _addToCart(intent.cart);
      case UpdateCartQuantityIntent():
        _updateCartQuantity(intent.id,intent.quantity);
      case DeleteItemFromCartIntent():
       _deleteItemFromCart(intent.id);
      case GetAllItemFromCartIntent():
        _getAllItems();
    }
  }

  void _addToCart(AddProductCartModel cart) async{
    emit(state.copyWith(
      cartStatus: const StateStatus.loading()
    ));
    final result=await _addToCartUseCase.call(cart);
    switch(result){

      case SuccessResult<CartEntity>():
        emit(state.copyWith(
            cartStatus:  StateStatus.success(result.data)
        ));
      case FailedResult<CartEntity>():
        emit(state.copyWith(
            cartStatus:  StateStatus.failure(ResponseException(message: result.error))
        ));
    }
  }

  void _updateCartQuantity(
      String id,UpdateCartQuantity updateQuantity
      ) async{
    emit(state.copyWith(
        cartStatus: const StateStatus.loading()
    ));
    final result=await _updateCartQuantityUseCase.call(id, updateQuantity);
    switch(result){

      case SuccessResult<CartEntity>():
        emit(state.copyWith(
            cartStatus:  StateStatus.success(result.data)
        ));
      case FailedResult<CartEntity>():
        emit(state.copyWith(
            cartStatus:  StateStatus.failure(ResponseException(message: result.error))
        ));
    }
  }

  void _deleteItemFromCart(String id) async{
    emit(state.copyWith(
        cartStatus: const StateStatus.loading()
    ));
    final result=await _deleteItemFromCartUseCase.call(id);
    switch(result){

      case SuccessResult<CartEntity>():
        emit(state.copyWith(
            cartStatus:  StateStatus.success(result.data)
        ));
      case FailedResult<CartEntity>():
        emit(state.copyWith(
            cartStatus:  StateStatus.failure(ResponseException(message: result.error))
        ));
    }
  }

  void _getAllItems() async{
    emit(state.copyWith(
        cartStatus: const StateStatus.loading()
    ));
    final result=await _getAllCartItemsUseCase.call();
    switch(result){

      case SuccessResult<CartEntity>():
        emit(state.copyWith(
            cartStatus:  StateStatus.success(result.data)
        ));
      case FailedResult<CartEntity>():
        emit(state.copyWith(
            cartStatus:  StateStatus.failure(ResponseException(message: result.error))
        ));
    }
  }

}