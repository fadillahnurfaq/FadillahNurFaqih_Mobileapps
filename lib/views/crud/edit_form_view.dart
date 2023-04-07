import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/bloc/edit/edit_product_bloc.dart';
import 'package:food_app_test/cubit/add_product/add_product_photo_url_cubit.dart';
import 'package:food_app_test/models/product_model.dart';
import 'package:food_app_test/utils/button/primary_button.dart';
import 'package:food_app_test/utils/constant.dart';
import 'package:food_app_test/utils/form/form_image_picker.dart';
import 'package:food_app_test/utils/form/input_text_field.dart';
import 'package:food_app_test/utils/loading/loading.dart';
import 'package:food_app_test/views/home/home_view.dart';

import '../../utils/state_util.dart';

class EditFormView extends StatelessWidget {
  final ProductModel product;
  const EditFormView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formState = GlobalKey<FormState>();
    final TextEditingController foodCodeController =
        TextEditingController(text: product.foodCode);

    final TextEditingController namaMenuController =
        TextEditingController(text: product.name);

    final TextEditingController priceMenuController =
        TextEditingController(text: product.price);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AddProductPhotoUrlCubit()..changePhotoUrl(product.picture!),
        ),
        BlocProvider(
          create: (context) => EditProductBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            splashRadius: 25.0,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("EDIT PRODUCT"),
        ),
        body: BlocListener<EditProductBloc, EditProductState>(
          listener: (context, state) {
            if (state is EditProductErrorState) {
              Get.back();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
            if (state is EditProductLoadingState) {
              Loading.show();
            }

            if (state is EditProductSuccessState) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil edit product!"),
                ),
              );
              Get.offAll(page: const HomeView());
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formState,
              child: Builder(builder: (context) {
                return Column(
                  children: [
                    kVerticalSpace(20.0),
                    InputTextField(
                      massageValidator: "Food code tidak boleh kosong",
                      controller: foodCodeController,
                      hintText: "Food code",
                    ),
                    InputTextField(
                      massageValidator: "Nama menu tidak boleh kosong",
                      controller: namaMenuController,
                      hintText: "Nama menu",
                    ),
                    InputTextField(
                      massageValidator: "Price tidak boleh kosong",
                      controller: priceMenuController,
                      keyboardType: TextInputType.number,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      hintText: "Price",
                    ),
                    FormImagePicker(
                      label: "Foto",
                      value: product.picture,
                      gallery: true,
                      onChanged: (v) {
                        context
                            .read<AddProductPhotoUrlCubit>()
                            .changePhotoUrl(v);
                      },
                    ),
                    BlocBuilder<AddProductPhotoUrlCubit, String>(
                      builder: (context, photoUrl) {
                        return PrimaryButton(
                          height: 50.0,
                          onPressed: () {
                            if (!formState.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              return;
                            } else if (photoUrl.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Photo anda masih kosong"),
                                ),
                              );
                            } else {
                              FocusScope.of(context).unfocus();
                              final ProductModel data = ProductModel(
                                foodCode: foodCodeController.text,
                                name: namaMenuController.text,
                                picture: photoUrl,
                                pictureOri: "",
                                createdAt: DateTime.now().toIso8601String(),
                                price: priceMenuController.text,
                              );
                              context
                                  .read<EditProductBloc>()
                                  .add(EditProductEvent(data, product.id!));
                            }
                          },
                          title: "Edit Product",
                        );
                      },
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
