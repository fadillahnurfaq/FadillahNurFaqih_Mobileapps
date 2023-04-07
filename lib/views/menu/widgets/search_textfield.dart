import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          filled: true,
          fillColor: kGreyColor,
          prefixIcon: const Icon(
            Icons.search,
            color: kBlueSoftColor,
          ),
          hintText: "Cari Menu",
          hintStyle: const TextStyle(
            fontSize: 14.0,
          ),
          border: _borders(),
        ),
      ),
    );
  }

  _borders() {
    return const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    );
  }
}
