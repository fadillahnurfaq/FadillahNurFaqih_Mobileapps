import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/state_util.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.strokeColorInput,
    this.backgroundInput,
    this.inputFormatter,
    required this.massageValidator,
    required this.controller,
  });

  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Color? strokeColorInput;
  final Color? backgroundInput;
  final String massageValidator;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: SizedBox(
        width: Get.width,
        child: TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatter,
          decoration: InputDecoration(
            contentPadding: prefixIcon != null
                ? const EdgeInsets.only(top: 14.0)
                : const EdgeInsets.all(18.0),
            filled: true,
            hintText: hintText,
            focusedBorder: _borders(),
            enabledBorder: _borders(),
            hoverColor: Colors.white,
          ),
          controller: controller,
          // onChanged: onChanged,
          validator: (value) {
            if (value!.isEmpty) {
              return massageValidator;
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  _borders() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
    );
  }
}
