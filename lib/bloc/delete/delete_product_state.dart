part of 'delete_product_bloc.dart';

abstract class DeleteProductState extends Equatable {
  const DeleteProductState();

  @override
  List<Object> get props => [];
}

class DeleteProductInitialState extends DeleteProductState {}

class DeleteProductLoadingState extends DeleteProductState {}

class DeleteProductSuccessState extends DeleteProductState {
  const DeleteProductSuccessState();

  @override
  List<Object> get props => [];
}

class DeleteProductErrorState extends DeleteProductState {
  final String errorMessage;
  const DeleteProductErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
