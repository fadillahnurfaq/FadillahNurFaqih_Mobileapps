import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/models/product_model.dart';
import 'package:food_app_test/service/product_service.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  GetProductBloc() : super(GetProductInitialState()) {
    on<GetProductEvent>((event, emit) async {
      try {
        emit(GetProductLoadingState());

        final res = await ProductService().getProduct();
        res.fold((l) => emit(GetProductErrorState(l)),
            (r) => emit(GetProductLoadedState(r)));
      } catch (e) {
        emit(GetProductErrorState(e.toString()));
      }
    });
  }
}
