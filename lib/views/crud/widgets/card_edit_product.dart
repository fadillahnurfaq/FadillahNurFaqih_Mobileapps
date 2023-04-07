import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_test/models/product_model.dart';
import 'package:food_app_test/utils/button/primary_button.dart';
import 'package:food_app_test/utils/currency_format.dart';
import 'package:food_app_test/utils/state_util.dart';
import 'package:food_app_test/views/crud/edit_form_view.dart';

import '../../../utils/constant.dart';

class CardEditProduct extends StatelessWidget {
  final ProductModel product;
  const CardEditProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white.withOpacity(.2),
                child: CachedNetworkImage(
                  imageUrl: product.picture == null
                      ? "https://i.ibb.co/TWLKGMY/No-Image-Available.jpg"
                      : product.picture!.contains("localhost")
                          ? "https://i.ibb.co/TWLKGMY/No-Image-Available.jpg"
                          : product.picture!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (_, __) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: kHeading6,
                  ),
                  kVerticalSpace(15.0),
                  RichText(
                    text: TextSpan(
                      text: CurrencyFormat.convertToIdr(
                        double.parse(product.price.toString()),
                        0,
                      ),
                      style: kHeading6.copyWith(color: kPrimaryColor),
                      children: [
                        const WidgetSpan(
                            child: SizedBox(
                          width: 5.0,
                        )),
                        TextSpan(
                          text: "/ porsi",
                          style: kHeading6.copyWith(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    color: Colors.orange,
                    onPressed: () {
                      Get.to(page: EditFormView(product: product));
                    },
                    title: "Edit",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
