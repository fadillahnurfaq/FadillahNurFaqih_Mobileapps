import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_test/valuenotifier/cart_controller.dart';

import '../../../utils/constant.dart';
import '../../../utils/currency_format.dart';

class OrderContent extends StatelessWidget {
  final dynamic cart;
  const OrderContent({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          // Container(
          //   height: 60.0,
          //   width: 60.0,
          //   color: Colors.red,
          // ),
          CachedNetworkImage(
            imageUrl: cart["picture"] == null
                ? "https://i.ibb.co/TWLKGMY/No-Image-Available.jpg"
                : cart["picture"].contains("localhost")
                    ? "https://i.ibb.co/TWLKGMY/No-Image-Available.jpg"
                    : cart["picture"],
            fit: BoxFit.cover,
            height: 60.0,
            width: 60.0,
            // width: double.infinity,
            placeholder: (_, __) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          kHorizontalSpace(10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart["name"],
                  style: kHeading6,
                ),
                kVerticalSpace(5.0),
                RichText(
                  text: TextSpan(
                    text: CurrencyFormat.convertToIdr(
                      double.parse(cart["price"].toString()),
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
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  CartController.reduceQuantity(cart["id"]);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 30.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              ),
              kHorizontalSpace(20.0),
              Text(
                cart["qty"].toString(),
              ),
              kHorizontalSpace(20.0),
              Material(
                borderRadius: BorderRadius.circular(5.0),
                color: kPrimaryColor,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    CartController.addQuantity(
                      cart["id"],
                    );
                  },
                  child: const SizedBox(
                    height: 30.0,
                    width: 45.0,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
