import 'package:flutter_bloc/flutter_bloc.dart';

class MenuKembalianCubit extends Cubit<double> {
  MenuKembalianCubit() : super(0);

  void getKembalian(String total, String uangDibayar) {
    if (uangDibayar.isNotEmpty) {
      emit(double.parse(uangDibayar) - double.parse(total));
    } else {
      emit(0);
    }
  }
}
