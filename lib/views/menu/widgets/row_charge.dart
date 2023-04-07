import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/cubit/menu/menu_kembalian_cubit.dart';
import 'package:food_app_test/valuenotifier/cart_controller.dart';
import 'package:food_app_test/views/menu/widgets/detail_pesanan_content.dart';
import 'package:food_app_test/views/menu/widgets/kembalian_content.dart';
import 'package:food_app_test/views/menu/widgets/total_bayar_content.dart';
import 'package:food_app_test/views/menu/widgets/uang_dibayar_content.dart';

import '../../../utils/button/primary_button.dart';
import '../../../utils/constant.dart';
import '../../../utils/currency_format.dart';
import '../../../utils/state_util.dart';

class RowCharge extends StatelessWidget {
  const RowCharge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: CartController.total,
      builder: (_, total, __) {
        return ValueListenableBuilder<List<dynamic>>(
          valueListenable: CartController.carts,
          builder: (_, carts, __) {
            return Row(
              children: [
                Badge(
                  label: Text(
                    "${carts.length}",
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ),
                kHorizontalSpace(10.0),
                Expanded(
                  child: Text(
                    CurrencyFormat.convertToIdr(
                      total,
                      0,
                    ),
                    style: kHeading6,
                  ),
                ),
                PrimaryButton(
                  onPressed: () {
                    if (carts.isNotEmpty) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Stack(
                              children: [
                                BlocProvider(
                                  create: (context) => MenuKembalianCubit(),
                                  child: Container(
                                    height: carts.length == 1 ? 380.0 : 460.0,
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        kVerticalSpace(30.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.restaurant_menu,
                                              size: 30.0,
                                              color: kPrimaryColor,
                                            ),
                                            kHorizontalSpace(10.0),
                                            Text(
                                              "Detail Pesanan",
                                              style: kHeading5.copyWith(
                                                  color: kPrimaryColor,
                                                  fontSize: 18.0),
                                            )
                                          ],
                                        ),
                                        kVerticalSpace(15.0),
                                        Expanded(
                                          child: ListView.builder(
                                            physics: const ScrollPhysics(),
                                            itemCount: carts.length,
                                            itemBuilder: (context, index) {
                                              final cart = carts[index];
                                              return DetailPesananContent(
                                                  cart: cart);
                                            },
                                          ),
                                        ),
                                        kVerticalSpace(10.0),
                                        TotalBayarContent(
                                            total: total.toString()),
                                        UangDibayarContent(
                                          total: total,
                                        ),
                                        const KembalianContent(),
                                        PrimaryButton(
                                            onPressed: () {},
                                            title: "Cetak Struk"),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    splashRadius: 20.0,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  width: 100.0,
                  height: 40.0,
                  title: "Charge",
                ),
              ],
            );
          },
        );
      },
    );
  }
}
