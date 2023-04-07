import 'package:flutter/material.dart';
import 'package:food_app_test/models/menu_app_model.dart';
import 'package:food_app_test/utils/constant.dart';
import 'package:food_app_test/utils/state_util.dart';
import 'package:food_app_test/valuenotifier/cart_controller.dart';
import 'package:food_app_test/views/crud/add_product_view.dart';
import 'package:food_app_test/views/crud/delete_product_view.dart';
import 'package:food_app_test/views/crud/edit_product_view.dart';
import 'package:food_app_test/views/home/widgets/card_menu.dart';
import 'package:food_app_test/views/menu/menu_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuAppModel> menus = [
      MenuAppModel(
        icon: Icons.add,
        title: "Add Product",
        color: Colors.green,
        onTap: () {
          Get.to(page: const AddProductView());
        },
      ),
      MenuAppModel(
        icon: Icons.shopping_cart,
        title: "Menu",
        color: kPrimaryColor,
        onTap: () {
          Get.to(page: const MenuView());
          CartController.totalPayment();
        },
      ),
      MenuAppModel(
        icon: Icons.edit,
        title: "Edit Product",
        color: Colors.orange,
        onTap: () {
          Get.to(page: const EditProductView());
        },
      ),
      MenuAppModel(
        icon: Icons.delete,
        title: "Delete Product",
        color: Colors.red,
        onTap: () {
          Get.to(page: const DeleteProductView());
        },
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            kVerticalSpace(10.0),
            Expanded(
              child: GridView.builder(
                physics: const ScrollPhysics(),
                itemCount: menus.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  final MenuAppModel menu = menus[index];
                  return CardMenu(
                    icon: menu.icon,
                    color: menu.color,
                    onTap: menu.onTap,
                    title: menu.title,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
