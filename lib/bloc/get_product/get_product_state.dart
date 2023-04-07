part of 'get_product_bloc.dart';

abstract class GetProductState extends Equatable {
  const GetProductState();

  @override
  List<Object> get props => [];
}

class GetProductInitialState extends GetProductState {}

class GetProductLoadingState extends GetProductState {}

class GetProductLoadedState extends GetProductState {
  final List<ProductModel> datas;
  const GetProductLoadedState(this.datas);

  @override
  List<Object> get props => [datas];
}

class GetProductErrorState extends GetProductState {
  final String errorMessage;
  const GetProductErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
