import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/valuenotifier/cart_controller.dart';

import '../../../cubit/menu/menu_expand_cubit.dart';
import '../../../utils/constant.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<dynamic>>(
        valueListenable: CartController.carts,
        builder: (_, carts, __) {
          return Material(
            color: kPrimaryColor,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                if (carts.isNotEmpty) {
                  context.read<MenuExpandCubit>().changeVisible();
                }
              },
              child: const SizedBox(
                height: 25.0,
                width: 25.0,
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
