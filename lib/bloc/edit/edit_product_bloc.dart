import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/service/product_service.dart';

import '../../models/product_model.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  EditProductBloc() : super(EditProductInitialState()) {
    on<EditProductEvent>((event, emit) async {
      try {
        emit(EditProductLoadingState());

        final res = await ProductService().editProduct(event.data, event.id);
        res.fold((l) => emit(EditProductErrorState(l)),
            (r) => emit(EditProductSuccessState()));
      } catch (e) {
        emit(EditProductErrorState(e.toString()));
      }
    });
  }
}
