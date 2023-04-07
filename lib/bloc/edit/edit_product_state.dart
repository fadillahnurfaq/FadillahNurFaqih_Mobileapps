part of 'edit_product_bloc.dart';

abstract class EditProductState extends Equatable {
  const EditProductState();

  @override
  List<Object> get props => [];
}

class EditProductInitialState extends EditProductState {}

class EditProductLoadingState extends EditProductState {}

class EditProductSuccessState extends EditProductState {}

class EditProductErrorState extends EditProductState {
  final String errorMessage;
  const EditProductErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
