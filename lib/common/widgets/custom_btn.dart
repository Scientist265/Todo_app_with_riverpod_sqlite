import 'package:flutter/material.dart';
import 'package:todo_app_withapi/common/widgets/reusable_text.dart';
import 'package:todo_app_withapi/common/widgets/text_style.dart';

class CustomOtlnBtn extends StatelessWidget {
  const CustomOtlnBtn(
      {super.key,
      this.onTap,
      required this.width,
      required this.height,
      this.color,
      required this.color2,
      required this.text});
  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color;
  final Color color2;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(width: 1, color: color2),
        ),
        child: Center(
          child: ReusableText(
              text: text, style: appStyle(18, color2, FontWeight.bold)),
        ),
      ),
    );
  }
}
