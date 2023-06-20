import 'package:book_store/shared/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final TextInputType keyboardType;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    this.text = '',
    this.onSaved,
    this.validator,
    this.hint = '',
    this.keyboardType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomText(
        text: text,
        fontSize: 14,
        color: Colors.grey.shade900,
      ),
      TextFormField(
        onSaved: onSaved,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          fillColor: Colors.white,
        ),
      ),
    ]);
  }
}
