import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/cubit/menu/menu_kembalian_cubit.dart';

import '../../../utils/constant.dart';
import '../../../utils/currency_format.dart';

class KembalianContent extends StatelessWidget {
  const KembalianContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuKembalianCubit, double>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Kembalian",
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
                color: Colors.green.withOpacity(.4),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      CurrencyFormat.convertToIdr(
                        state,
                        0,
                        symbol: "",
                      ),
                      style: kHeading6,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
