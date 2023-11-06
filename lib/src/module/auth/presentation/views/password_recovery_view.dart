import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/util/app_constants/app_constants.dart';
import '../../../../config/util/app_widgets/bar/custom_app_bar.dart';
import '../../../../config/util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../config/util/app_widgets/inputs/custom_text_form_field.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailCont = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    bool isEmail(String input) => EmailValidator.validate(input);

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //backgroundColor: AppColors.bgColorMain,
      // appBar: CustomAppBar(title: '', bgColor: AppColors.bgColorMain),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(left: 15, right: 15, top: 15, bottom: 45),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Восстановление пароля',
                      //style: AppTextStyles.black30Bold,
                      style: textTheme.displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                70.verticalSpace,
                Text(
                  'Пожалуйста, введите свой адрес электронной почты. Вы получите ссылку для создания нового пароля по электронной почте.',
                  //style: AppTextStyles.black16,
                  style: textTheme.displaySmall,
                ),

                /// Email
                30.verticalSpace,

                CustomTextFormField(
                  controller: emailCont,
                  sizedBoxWidth: double.infinity,
                  labelText: 'Эл. почта',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле не должно быть пустым!';
                    } else if (!isEmail(value!)) {
                      return 'Пример: your@email.com';
                    }
                    return null;
                  },
                ),

                /// Button
                70.verticalSpace,

                CustomElevatedButton(
                  sizedBoxHeight: 48.h,
                  sizedBoxWidth: double.infinity,
                  //borderRadius: 30,
                  text: 'Отправить',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      log('reg');
                      //TODO Добавить востановление пароля
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
