import 'package:equatable/equatable.dart';

class UpdateProductEntity extends Equatable {
  final int? quantity;

  const UpdateProductEntity({
    this.quantity,
  });

  @override
  List<Object?> get props => [
    quantity,
  ];
}