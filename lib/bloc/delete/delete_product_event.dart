part of 'delete_product_bloc.dart';

class DeleteProductEvent extends Equatable {
  final int id;
  const DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}
