import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/bloc/get_product/get_product_bloc.dart';
import 'package:food_app_test/cubit/menu/menu_expand_cubit.dart';
import 'package:food_app_test/models/product_model.dart';
import 'package:food_app_test/utils/constant.dart';
import 'package:food_app_test/utils/state_util.dart';
import 'package:food_app_test/valuenotifier/cart_controller.dart';
import 'package:food_app_test/views/menu/widgets/card_product.dart';
import 'package:food_app_test/views/menu/widgets/circle_button.dart';
import 'package:food_app_test/views/menu/widgets/row_charge.dart';
import 'package:food_app_test/views/menu/widgets/search_textfield.dart';

import 'widgets/order_content.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuExpandCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductBloc()..add(const GetProductEvent()),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              splashRadius: 25.0,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const SearchTextfield(),
          ),
          body: BlocBuilder<GetProductBloc, GetProductState>(
            builder: (context, state) {
              if (state is GetProductLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetProductErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is GetProductLoadedState) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: state.datas.length,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 5.0,
                          childAspectRatio: 10 / 16,
                        ),
                        itemBuilder: (context, index) {
                          final ProductModel product = state.datas[index];
                          return CardProduct(
                            product: product,
                          );
                        },
                      )
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          floatingActionButton: const CircleButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BlocBuilder<MenuExpandCubit, bool>(
            builder: (context, state) {
              return Container(
                height: state == false
                    ? 70.0
                    : MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: kPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RowCharge(),
                      Visibility(
                        visible: state == true,
                        child: kVerticalSpace(20.0),
                      ),
                      ValueListenableBuilder<List<dynamic>>(
                        valueListenable: CartController.carts,
                        builder: (_, carts, __) {
                          return Visibility(
                            visible: state == true,
                            child: ListView.builder(
                              physics: const ScrollPhysics(),
                              itemCount: carts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final dynamic cart = carts[index];
                                return OrderContent(
                                  cart: cart,
                                );
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
