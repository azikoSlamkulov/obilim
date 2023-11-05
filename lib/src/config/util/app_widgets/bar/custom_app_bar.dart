import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obilim/src/config/util/app_constants/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  //with PreferredSizeWidget
  CustomAppBar({
    key,
    required this.title,
    this.bgColor = AppColors.mainColor,
    //this.bottom = false,
  })  : preferredSize = Size.fromHeight(60.0.h),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: bgColor,
      title: Text(
        title,
        // style: TextStyle(
        //   color: Colors.white,
        //   fontSize: 18.sp,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
      centerTitle: true,

      elevation: 0,
      //bottom: bottom,
    );
  }
}
