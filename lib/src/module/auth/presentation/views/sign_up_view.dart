import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/util/app_constants/app_constants.dart';
import '../../../../config/util/app_widgets/bar/custom_app_bar.dart';
import '../../../../config/util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../config/util/app_widgets/inputs/custom_text_form_field.dart';
import '../logic/auth/auth_bloc.dart';
import '../logic/category_toggle_btn/type_toggle_btn_cubit.dart';
import '../widgets/custom_toggle_button.dart';

final TextEditingController userNameCont = TextEditingController();
final TextEditingController emailCont = TextEditingController();
final TextEditingController passwordCont = TextEditingController();
final TextEditingController firstNameCont = TextEditingController();
final TextEditingController lastNameCont = TextEditingController();

class SignUpView extends StatelessWidget {
  SignUpView({
    Key? key,
  }) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final userNameCont = TextEditingController();
  // final emailCont = TextEditingController();
  // final passwordCont = TextEditingController();
  // final firstNameCont = TextEditingController();
  // final lastNameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String typeChoice = '';
    bool isEmail(String input) => EmailValidator.validate(input);
    return Scaffold(
      //backgroundColor: AppColors.bgColorMain,
      //appBar: CustomAppBar(title: '', bgColor: AppColors.bgColorMain),
      appBar: AppBar(),
      body: Padding(
        padding: REdgeInsets.only(left: 15, right: 15, top: 15, bottom: 45),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //60.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Регистрация',
                      //style: AppTextStyles.black34Bold,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                50.verticalSpace,

                /// Name
                CustomTextFormField(
                  controller: userNameCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Логин',
                ),
                5.verticalSpace,

                /// eMail
                CustomTextFormField(
                  controller: emailCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Почта',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле не должно быть пустым!';
                    } else if (!isEmail(value!)) {
                      return 'Пример: your@email.com';
                    }
                    return null;
                  },
                ),
                5.verticalSpace,

                /// Password
                CustomTextFormField(
                  controller: passwordCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Пароль',
                ),
                CustomTextFormField(
                  controller: firstNameCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Имя',
                ),
                5.verticalSpace,

                CustomTextFormField(
                  controller: lastNameCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Фамилия',
                ),
                //5.verticalSpace,
                40.verticalSpace,

                BlocBuilder<TypeToggleBtnCubit, TypeToggleBtnState>(
                  builder: (context, state) {
                    if (state is TypeInitialState) {
                      return buildTypeButtons(context, state.isSelected);
                    } else if (state is TypeSelectedState) {
                      typeChoice = state.typeChoice;
                      return buildTypeButtons(context, state.isSelected);
                    }
                    return const Center(child: Text('Error'));
                  },
                ),

                70.verticalSpace,

                /// Button
                CustomElevatedButton(
                  sizedBoxHeight: 48.h,
                  //sizedBoxWidth: double.infinity,
                  //borderRadius: 30,
                  text: 'Регистрация',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        SignUpEvent(
                          username: userNameCont.text,
                          email: emailCont.text,
                          password: passwordCont.text,
                          firstName: firstNameCont.text,
                          lastName: lastNameCont.text,
                          type: typeChoice,
                        ),
                      );
                    }

                    userNameCont.clear();
                    emailCont.clear();
                    passwordCont.clear();
                    firstNameCont.clear();
                    lastNameCont.clear();
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

buildTypeButtons(BuildContext context, List<bool> isSelected) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 122.h,
        isActivity: isSelected[0],
        text: 'Студент',
        onPressed: () {
          BlocProvider.of<TypeToggleBtnCubit>(context).selected(0);
        },
      ),
      5.horizontalSpace,
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 122.h,
        isActivity: isSelected[1],
        text: 'Учитель',
        onPressed: () {
          BlocProvider.of<TypeToggleBtnCubit>(context).selected(1);
        },
      ),
      5.horizontalSpace,
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 122.h,
        text: 'Админ',
        isActivity: isSelected[2],
        onPressed: () {
          BlocProvider.of<TypeToggleBtnCubit>(context).selected(2);
        },
      ),
      5.horizontalSpace,
      CustomToggleButton(
        sizedBoxHeight: 40.h,
        sizedBoxWidth: 122.h,
        text: 'Родитель',
        isActivity: isSelected[3],
        onPressed: () {
          BlocProvider.of<TypeToggleBtnCubit>(context).selected(3);
        },
      ),
    ],
  );
}
