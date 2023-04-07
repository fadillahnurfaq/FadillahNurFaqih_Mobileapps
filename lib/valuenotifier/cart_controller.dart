import 'package:flutter/widgets.dart';
import 'package:food_app_test/models/product_model.dart';
import 'package:food_app_test/utils/state_util.dart';

import '../utils/main_storage.dart';

class CartController extends ChangeNotifier {
  static ValueNotifier<List> carts =
      ValueNotifier(mainStorage.get("cart") ?? []);
  static ValueNotifier<double> total = ValueNotifier(0.0);
  static Future<void> saveToLocalStorage() async {
    await mainStorage.put("cart", carts.value);
  }

  static isCart(int id) {
    if (carts.value.indexWhere((element) => element["id"] == id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  static addToCart({required ProductModel product}) {
    if (!isCart(product.id!)) {
      carts.value.add({
        'food_code': product.foodCode,
        'name': product.name,
        'picture': product.picture,
        'picture_ori': product.pictureOri,
        'created_at': product.createdAt,
        'price': product.price,
        'id': product.id,
        'qty': 1,
      });
      carts.notifyListeners();
      totalPayment();
    } else {
      addQuantity(product.id!);
    }
    saveToLocalStorage();
  }

  static removeCart(int id) {
    carts.value.removeWhere((element) => element["id"] == id);
    saveToLocalStorage();
    carts.notifyListeners();
    totalPayment();
    if (carts.value.isEmpty) {
      Get.back();
    }
  }

  static addQuantity(int id) async {
    var targetIndex = carts.value.indexWhere((waste) => waste["id"] == id);
    carts.value[targetIndex]["qty"]++;
    carts.notifyListeners();
    await saveToLocalStorage();
    totalPayment();
  }

  static reduceQuantity(int id) async {
    var targetIndex = carts.value.indexWhere((waste) => waste["id"] == id);
    carts.value[targetIndex]["qty"]--;
    saveToLocalStorage();
    carts.notifyListeners();

    totalPayment();
    if (carts.value[targetIndex]["qty"] <= 0) {
      removeCart(id);
    }
  }

  static void totalPayment() {
    double totalPayment = 0;

    for (var i = 0; i < carts.value.length; i++) {
      totalPayment += (double.parse(carts.value[i]["price"].toString()) *
          carts.value[i]["qty"]);
    }

    total.value = totalPayment;
    total.notifyListeners();
  }
}
