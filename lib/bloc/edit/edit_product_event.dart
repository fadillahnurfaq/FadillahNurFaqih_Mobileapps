part of 'edit_product_bloc.dart';

class EditProductEvent extends Equatable {
  final ProductModel data;
  final int id;
  const EditProductEvent(this.data, this.id);

  @override
  List<Object> get props => [data];
}
