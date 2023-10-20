import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obilim/src/module/auth/presentation/views/password_recovery_view.dart';
import 'package:obilim/src/module/auth/presentation/views/sign_up_view.dart';

import '../../../../util/app_constants/app_constants.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../util/app_widgets/dialogs/custom_snackbar.dart';
import '../../../../util/app_widgets/inputs/custom_text_form_field.dart';
import '../logic/auth/auth_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticationFailureState) {
          CustomSnackbar().getSnackbar(
            context: context,
            title: 'Ошибка авторизации!',
            isError: true,
          );
        }
      },
      child: const NestedSignInView(),
    );
  }
}

class NestedSignInView extends StatelessWidget {
  const NestedSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    //bool isEmail(String input) => EmailValidator.validate(input);
    return Scaffold(
      //backgroundColor: AppColors.bgColorMain,
      //appBar: CustomAppBar(title: '', bgColor: AppColors.bgColorMain),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15, vertical: 45),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                80.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Авторизация',
                      //style: AppTextStyles.black34Bold,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),

                60.verticalSpace,

                /// eMail
                CustomTextFormField(
                  controller: loginController,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Логин',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле не должно быть пустым!';
                    }
                    // else if (!isEmail(value!)) {
                    //   return 'Не правильно введена почта';
                    // }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                5.verticalSpace,

                /// Password
                CustomTextFormField(
                  controller: passwordController,
                  sizedBoxWidth: double.infinity,
                  labelText: 'Пароль',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Поле не должно быть пустым!';
                    }
                    return null;
                  },
                ),
                5.verticalSpace,

                /// Text Button Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordRecoveryView(),
                          ),
                        );
                      },
                      icon: Text(
                        'Забыли пароль?',
                        //style: AppTextStyles.black16,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      label: AppAssets.arrowRight(
                        width: 30,
                        height: 20,
                      ),
                    ),
                  ],
                ),
                60.verticalSpace,

                /// Button
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text('Авторизация'),
                // ),
                CustomElevatedButton(
                  sizedBoxHeight: 48.h,
                  //sizedBoxWidth: double.infinity,
                  //borderRadius: 50,
                  text: 'Авторизация',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        SignInWithEmailEvent(
                          loginController.text,
                          passwordController.text,
                        ),
                      );
                    }
                  },
                ),
                10.verticalSpace,

                /// Text Button Icon
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpView(),
                      ),
                    );
                  },
                  child: Text(
                    'Регистрация. ',
                    //style: AppTextStyles.blue16,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Если нет регистрации. ',
                //       style: AppTextStyles.black16,
                //     ),
                //     TextButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => SignUpView(),
                //           ),
                //         );
                //       },
                //       child: Text(
                //         'Регистрация. ',
                //         style: AppTextStyles.blue16,
                //       ),
                //     ),
                //   ],
                // ),
                // 100.verticalSpace,
                // Text(
                //   'Или авторизуйтесь с помощью соц. сетей.',
                //   style: AppTextStyles.black16,
                // ),
                // 50.verticalSpace,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // WidgetBtnFacebook(onTap: () {}),
                //     // AppSized.w20,
                //     // WidgetBtnGoogle(
                //     //   onTap: () => BlocProvider.of<AuthBloc>(context).add(
                //     //     SignInWithGoogleEvent(),
                //     //   ),
                //     // ),
                //     IconButton(
                //       iconSize: 50.h,
                //       icon: AppAssets.facebookLogo(),
                //       onPressed: () {},
                //     ),
                //     30.horizontalSpace,
                //     IconButton(
                //       iconSize: 47.h,
                //       icon: AppAssets.googleLogo(),
                //       onPressed: () {
                //         BlocProvider.of<AuthBloc>(context).add(
                //           SignInWithGoogleEvent(),
                //         );
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
