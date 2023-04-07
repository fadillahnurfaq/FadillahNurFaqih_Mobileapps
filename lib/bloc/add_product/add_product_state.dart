part of 'add_product_bloc.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductInitialState extends AddProductState {}

class AddProductLoadingState extends AddProductState {}

class AddProductSuccessState extends AddProductState {}

class AddProductErrorState extends AddProductState {
  final String errorMessage;
  const AddProductErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
