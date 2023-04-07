import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/currency_format.dart';

class TotalBayarContent extends StatelessWidget {
  final String total;
  const TotalBayarContent({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Total",
              style: kHeading6,
            ),
          ),
          Text(
            ":",
            style: kHeading6,
          ),
          kHorizontalSpace(10.0),
          Container(
            height: 30.0,
            width: 150.0,
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  CurrencyFormat.convertToIdr(
                    double.parse(total),
                    symbol: "",
                    0,
                  ),
                  style: kHeading6,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
