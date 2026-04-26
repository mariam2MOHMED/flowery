import 'package:equatable/equatable.dart';

class AddProductCartEntity extends Equatable {
  final String? product;
  final int? quantity;

  const AddProductCartEntity({
    this.product,
    this.quantity,
  });

  @override
  List<Object?> get props => [
    product,
    quantity,
  ];
}