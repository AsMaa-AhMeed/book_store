import 'package:book_store/shared/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String assetName;
  final void Function()? onPressed;
  const CustomSocialButton({
    this.text = '',
    this.assetName = '',
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade100,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(5)),
            ),
            child: Image.asset(
              assetName,
              width: 25,
              height: 25,
            ),
          ),
          CustomText(
            text: text,
          ),
        ],
      ),
    );
  }
}
