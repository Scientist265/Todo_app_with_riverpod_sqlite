import 'package:flutter/material.dart';
import 'package:todo_app_withapi/common/utils/constants.dart';
import 'package:todo_app_withapi/common/widgets/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyBoardType,
      required this.hintText,
      this.suffixIcon,
      this.preffixIcon,
      this.hintStyle,
      required this.controller,
      this.onChanged});

  final TextInputType? keyBoardType;
  final String hintText;
  final Widget? suffixIcon, preffixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth * 0.9,
      decoration: BoxDecoration(
          color: AppConst.kLight,
          borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))),
      child: TextFormField(
        keyboardType: keyBoardType,
        controller: controller,
        cursorHeight: 20,
        onChanged: onChanged,
        style: appStyle(18, AppConst.kBkDark, FontWeight.w700),
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon,
            suffixIconColor: AppConst.kBkDark,
            hintStyle: hintStyle,
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppConst.kRed, width: 0.5)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppConst.kRed, width: 0.5)),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppConst.kGreyDk, width: 0.5)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppConst.kBkDark, width: 0.5))),
      ),
    );
  }
}
