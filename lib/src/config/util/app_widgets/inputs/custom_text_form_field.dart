import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    this.labelText,
    this.labelStyle,
    this.initialValue,
    this.hintText,
    this.hintStyle,
    this.counterText,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.fillColor,
    this.enabledBorderColor,
    //this.border,
    this.autofocus,
    this.sizedBoxHeight = 55.0,
    this.sizedBoxWidth = double.infinity,
    this.enabled = true,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String? counterText;
  final String? labelText;
  final String? initialValue;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? enabledBorderColor;
  //final InputBorder? border;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final double? sizedBoxHeight;
  final double? sizedBoxWidth;
  final bool enabled;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizedBoxHeight,
      width: sizedBoxWidth,
      child: TextFormField(
        enabled: enabled,
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboardType,
        //style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          //labelStyle: labelStyle ?? const TextStyle(color: Colors.black26),
          //hintText: hintText ?? '',
          //hintStyle: labelStyle ?? const TextStyle(color: AppColors.black26),
          //counterText: counterText,
          //prefixText: prefixText,
          //prefix: prefix,
          //prefixIcon: prefixIcon,
          //suffix: suffix,
          //suffixIcon: suffixIcon,
          //fillColor: fillColor ?? Colors.white,
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              //color: enabledBorderColor ?? Colors.black26,
              width: 0.5,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              //color: Colors.blue,
              width: 1.0,
              //style: BorderStyle.solid,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              //color: Colors.red,
              width: 1.0,
              //style: BorderStyle.solid,
            ),
          ),
          contentPadding: REdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым!';
              }
              return null;
            },
        onChanged: onChanged,
      ),
    );
  }
}
