import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/currency_format.dart';

class DetailPesananContent extends StatelessWidget {
  final dynamic cart;
  const DetailPesananContent({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
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
              mainAxisAlignment: MainAxisAlignment.end,
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
          Text(
            "x${cart["qty"]}",
            style: kHeading6,
          )
        ],
      ),
    );
  }
}
