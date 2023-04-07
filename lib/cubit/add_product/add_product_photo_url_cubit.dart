import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductPhotoUrlCubit extends Cubit<String> {
  AddProductPhotoUrlCubit() : super("");

  void changePhotoUrl(String value) {
    emit(value);
  }
}
