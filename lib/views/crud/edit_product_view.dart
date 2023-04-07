import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/bloc/get_product/get_product_bloc.dart';
import 'package:food_app_test/models/product_model.dart';
import 'package:food_app_test/utils/state_util.dart';
import 'package:food_app_test/views/crud/widgets/card_edit_product.dart';
import 'package:food_app_test/views/menu/widgets/search_textfield.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
                          return CardEditProduct(
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
        ),
      ),
    );
  }
}
