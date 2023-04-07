import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/models/product_model.dart';
import 'package:food_app_test/service/product_service.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitialState()) {
    on<AddProductEvent>((event, emit) async {
      try {
        emit(AddProductLoadingState());

        final res = await ProductService().addProduct(
          event.data,
        );

        res.fold((l) => emit(AddProductErrorState(l)),
            (r) => emit(AddProductSuccessState()));
      } catch (e) {
        emit(AddProductErrorState(e.toString()));
      }
    });
  }
}
