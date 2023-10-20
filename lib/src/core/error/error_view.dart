import 'package:flutter/material.dart';

import '../../util/app_constants/app_constants.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.error,
    super.key,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.white,
      body: Center(
        child: Text(
          //state.extra.toString(),
          'Что то пошло не так. Попробуйте еще раз.',
          style: AppTextStyles.black22,
        ),
      ),
    );
  }
}
