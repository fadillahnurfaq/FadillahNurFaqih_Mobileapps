part of 'add_product_bloc.dart';

class AddProductEvent extends Equatable {
  final ProductModel data;
  const AddProductEvent(
    this.data,
  );

  @override
  List<Object> get props => [];
}
