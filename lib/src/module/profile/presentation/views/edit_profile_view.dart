import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';

import '../../../../config/locator.dart';
import '../../../../config/util/app_constants/app_constants.dart';
import '../../../../config/util/app_widgets/bar/custom_app_bar.dart';
import '../../../../config/util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../config/util/app_widgets/inputs/custom_text_form_field.dart';
import '../../../auth/presentation/logic/category_toggle_btn/type_toggle_btn_cubit.dart';
import '../../../auth/presentation/widgets/custom_toggle_button.dart';
import '../logic/user/user_cubit.dart';

final TextEditingController firstNameCont = TextEditingController();
final TextEditingController lastNameCont = TextEditingController();
final TextEditingController phoneNumberCont = TextEditingController();
final TextEditingController birthDateCont = TextEditingController();

// class EditProfileView extends StatelessWidget {
//   const EditProfileView({
//     required this.user,
//     required this.token,
//     Key? key,
//   }) : super(key: key);

//   final UserEntity user;
//   final String token;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<UserCubit>(
//       create: (context) => sl<UserCubit>(),
//       child: NestedEditProfileView(
//         user: user,
//         token: token,
//       ),
//     );
//   }
// }

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    required this.user,
    required this.token,
    Key? key,
  }) : super(key: key);

  final UserEntity user;
  final String token;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final userNameCont = TextEditingController();
  // final emailCont = TextEditingController();
  // final passwordCont = TextEditingController();
  // final firstNameCont = TextEditingController();
  // final lastNameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String typeChoice = user.type!;
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
                      'Edit Profile',
                      //style: AppTextStyles.black34Bold,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                50.verticalSpace,

                /// First Name
                CustomTextFormField(
                  // controller: firstNameCont..text = user.firstName!,
                  controller: firstNameCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Имя',
                ),
                5.verticalSpace,

                ///Last Name
                CustomTextFormField(
                  // controller: lastNameCont..text = user.lastName!,
                  controller: lastNameCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Фамилия',
                ),
                5.verticalSpace,

                ///Phone Number
                CustomTextFormField(
                  controller: phoneNumberCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Номер телефона',
                ),
                5.verticalSpace,

                ///Birthdate
                CustomTextFormField(
                  controller: birthDateCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'День рождения',
                ),

                // 40.verticalSpace,

                // BlocBuilder<TypeToggleBtnCubit, TypeToggleBtnState>(
                //   builder: (context, state) {
                //     if (state is TypeInitialState) {
                //       return buildTypeButtons(context, state.isSelected);
                //     } else if (state is TypeSelectedState) {
                //       typeChoice = state.typeChoice;
                //       return buildTypeButtons(context, state.isSelected);
                //     }
                //     return const Center(child: Text('Error'));
                //   },
                // ),

                70.verticalSpace,

                /// Button
                CustomElevatedButton(
                  sizedBoxHeight: 48.h,
                  //sizedBoxWidth: double.infinity,
                  //borderRadius: 30,
                  text: 'Ok',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<UserCubit>(context).editCurentUser(
                        token: token,
                        id: user.id!,
                        firstName: firstNameCont.text,
                        lastName: lastNameCont.text,
                        phoneNumber: phoneNumberCont.text,
                        birthDate: birthDateCont.text,
                      );
                      Navigator.pop(context);
                    }
                    firstNameCont.clear();
                    lastNameCont.clear();
                    phoneNumberCont.clear();
                    birthDateCont.clear();
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

Future<void> showBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 100,
        color: AppColors.mainColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        // if (initialPage == 0) {
                        //   controller.getProfileImage(ImageSource.gallery);
                        //   Navigator.pop(context);
                        // } else {
                        //   controller.getAutoImage(ImageSource.gallery);
                        //   Navigator.pop(context);
                        // }
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.image,
                        color: AppColors.mainColor,
                      ),
                      iconSize: 40,
                    ),
                    //const SizedBox(height: 2),
                    const Text(
                      'Галерея',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 60),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        // if (controller.initialPage == 0) {
                        //   controller.getProfileImage(ImageSource.camera);
                        //   Navigator.pop(context);
                        // } else {
                        //   controller.getAutoImage(ImageSource.camera);
                        //   Navigator.pop(context);
                        // }
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.camera,
                        color: AppColors.mainColor,
                      ),
                      iconSize: 40,
                    ),
                    //const SizedBox(height: 10),
                    const Text(
                      'Камера',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    },
  );
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
