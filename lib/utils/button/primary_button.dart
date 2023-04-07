import 'package:flutter/material.dart';

import '../constant.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? color;
  final double? height, width;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? kPrimaryColor,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
