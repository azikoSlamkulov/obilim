import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 0.0,
    this.sizedBoxHeight = 60.0,
    this.sizedBoxWidth = double.infinity,
    // this.borderRadius = 5.0,
    // this.bgColor = AppColors.mainColor,
    // this.textColor = AppColors.white,
    // this.isBorderSide = false,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final double paddingHorizontal;
  final double paddingVertical;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
  //final double borderRadius;
  // final Color bgColor;
  // final Color textColor;
  //final bool isBorderSide;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizedBoxHeight,
      width: sizedBoxWidth,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: paddingHorizontal,
        //     vertical: paddingVertical,
        //   ),
        //   // shape: RoundedRectangleBorder(
        //   //   borderRadius: BorderRadius.circular(borderRadius),
        //   //   // side: isBorderSide
        //   //   //     ? const BorderSide(color: Color(0xFF9B9B9B))
        //   //   //     : BorderSide.none,
        //   // ),
        //   //primary: bgColor,
        //   //backgroundColor: bgColor,
        // ),
        onPressed: onPressed,
        child: Text(
          text,
          //style: AppTextStyles.white18Bold,
          //style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
