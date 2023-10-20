import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_constants/app_constants.dart';

class CustomSnackbar {
  getSnackbar({
    required BuildContext context,
    required String title,
    bool isError = false,
    String? contentText,
    Color? borderColor,
    Color? colorText,
    Color? backgroundColor,
    Widget? messageText,
  }) {
    final snackBar = SnackBar(
      content: isError
          ? Row(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 32.h,
                  color: Colors.white,
                ),
                16.horizontalSpace,
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.white20,
                  ),
                ),
              ],
            )
          : Text(
              title,
              style: AppTextStyles.white20,
            ),
      backgroundColor: isError ? AppColors.mainColor : Colors.blue,
      duration: const Duration(seconds: 4),
      behavior: SnackBarBehavior.fixed,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
