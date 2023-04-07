import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/cubit/menu/menu_kembalian_cubit.dart';

import '../../../utils/constant.dart';

class UangDibayarContent extends StatelessWidget {
  final double total;
  const UangDibayarContent({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Uang Dibayar",
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
            color: kGreyColor,
            child: TextFormField(
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyTextInputFormatter(
                  locale: "id",
                  symbol: "",
                  decimalDigits: 0,
                )
              ],
              onChanged: (value) {
                context.read<MenuKembalianCubit>().getKembalian(
                    total.toString().replaceAll(".0", ""),
                    value.replaceAll(".", ""));
              },
              validator: (value) {
                final bool isNumber = RegExp(r"^[0-9]+$").hasMatch(value!);
                if (!isNumber) {
                  return "This field is not in a valid number format";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
