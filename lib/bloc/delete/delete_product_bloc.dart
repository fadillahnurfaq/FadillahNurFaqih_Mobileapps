import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/service/product_service.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  DeleteProductBloc() : super(DeleteProductInitialState()) {
    on<DeleteProductEvent>((event, emit) async {
      try {
        emit(DeleteProductLoadingState());
        final res = await ProductService().deleteProduct(event.id);
        res.fold((l) => emit(DeleteProductErrorState(l)),
            (r) => emit(const DeleteProductSuccessState()));
      } catch (e) {
        emit(DeleteProductErrorState(e.toString()));
      }
    });
  }
}
