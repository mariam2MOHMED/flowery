import 'package:equatable/equatable.dart';
import 'package:flowerecommeric/core/state_status/state_status.dart';
import 'package:flowerecommeric/feature/cart/domain/entities/cart_entity.dart';

class CartState extends Equatable{
final StateStatus<CartEntity>cartStatus;
const CartState({
  this.cartStatus=const StateStatus.initial()
});
CartState copyWith({
  StateStatus<CartEntity>?cartStatus
}){
  return CartState(
  cartStatus: cartStatus??this.cartStatus
  );
}
  @override
  List<Object?> get props =>[cartStatus];

}