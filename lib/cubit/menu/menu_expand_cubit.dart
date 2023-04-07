
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuExpandCubit extends Cubit<bool> {
  MenuExpandCubit() : super(false);

  void changeVisible() {
    emit(!state);
  }
}
