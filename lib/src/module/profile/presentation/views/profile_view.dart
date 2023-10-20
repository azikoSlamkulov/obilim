import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';
import 'package:obilim/src/module/profile/presentation/logic/user_image/profile_image_cubit.dart';

import '../../../../../locator.dart';
import '../../../../core/app_widgets/profile_image/image_network_widget.dart';
import '../../../../core/app_widgets/profile_image/network_imag_widget.dart';
import '../../../../util/app_constants/app_constants.dart';
import '../../../../util/app_widgets/bar/custom_app_bar.dart';
import '../../../../util/app_widgets/drawer.dart';
import '../../../auth/presentation/logic/auth/auth_bloc.dart';
import '../../../auth/presentation/views/sign_in_view.dart';
import '../logic/user/user_cubit.dart';
import '../../../../core/app_widgets/profile_image/cached_network_image_widget.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          final token = state.token;
          return BlocProvider<UserCubit>(
            create: (context) => sl<UserCubit>()..getCurentUser(token: token),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoaded) {
                  return NestedProfileView(
                    user: state.user,
                    token: token,
                    blocContext: context,
                  );
                } else if (state is UserFailure) {
                  //return MyErrorWidget('${state.exception}');
                  return Text(state.message);
                } else {
                  //return const SomeError();,
                  return Text('');
                }
              },
            ),
          );
        }
        //TODO:
        return SignInView();
      },
    );
  }
}

class NestedProfileView extends StatelessWidget {
  NestedProfileView({
    required this.user,
    required this.token,
    required this.blocContext,
    super.key,
  });

  final UserEntity user;
  final String token;
  final BuildContext blocContext;

  File? file;
  String? profileImageFile;

  Future<File> getImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    profileImageFile = image!.path;
    File file = File(image.path);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () async {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return BlocProvider.value(
            //         value: BlocProvider.of<UserCubit>(blocContext),
            //         child: EditProfileView(
            //           user: user,
            //           token: token,
            //         ),
            //       );
            //     },
            //   ),
            // );
            //showBottomSheet(blocContext);
            file = await getImage(ImageSource.camera);
            blocContext.read<UserCubit>().uploadPhoto(
                  token: token,
                  id: user.id!,
                  file: file!,
                );
            // log('file ===>>> $file');
          },
          icon: const Icon(Icons.edit),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 250.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
              ),
              color: Theme.of(context).primaryColor.withOpacity(0.8),
            ),
            child: Column(
              children: [
                30.verticalSpace,
                NetworkImageWidget(
                  token: token,
                  user: user,
                ),
                20.verticalSpace,
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        //fontSize: 22,
                      ),
                )
              ],
            ),
          ),
          30.verticalSpace,
          Padding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              children: [
                // Text(
                //   'User info',
                //   style: Theme.of(context).textTheme.displaySmall!.copyWith(
                //         fontWeight: FontWeight.bold,
                //         color: Theme.of(context).hintColor,
                //       ),
                // ),
                // 20.verticalSpace,
                cardListTile(
                  context: context,
                  text1: 'User Name',
                  text2: user.username!,
                ),
                buildDivider(context),
                cardListTile(
                  context: context,
                  text1: 'Email',
                  text2: user.email!,
                ),
                buildDivider(context),
                cardListTile(
                  context: context,
                  text1: 'Phone',
                  text2: user.phoneNumber == null
                      ? 'Нет номера'
                      : '${user.phoneNumber}',
                ),
                buildDivider(context),
                cardListTile(
                  context: context,
                  text1: 'Birthdate',
                  text2: user.birthDate == null
                      ? 'Без даты рождения'
                      : '${user.birthDate}',
                ),
                buildDivider(context),
                cardListTile(
                  context: context,
                  text1: 'Type',
                  text2: user.type!,
                ),
                // 50.verticalSpace,
                // Text(
                //   'Settings',
                //   style: Theme.of(context).textTheme.displaySmall!.copyWith(
                //         fontWeight: FontWeight.bold,
                //         color: Theme.of(context).hintColor,
                //       ),
                // ),
                // cardListTile(
                //   context: context,
                //   text1: 'User Name',
                //   text2: 'Aziko',
                // ),
                // buildDivider(context),
                // cardListTile(
                //   context: context,
                //   text1: 'Email',
                //   text2: 'Aziko@mail.com',
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardListTile({
    required BuildContext context,
    required String text1,
    required String text2,
  }) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                ),
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(BuildContext context) {
    return Divider(
      //color: Colors.grey.shade300,
      color: Theme.of(context).dividerColor.withOpacity(0.5),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.h,
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
                          // file = await context
                          //     .read<UserCubit>()
                          //     .getProfileImage(ImageSource.gallery);
                          //file = await getImage(ImageSource.gallery);
                          // Navigator.pop(context);
                          //log('file ===>>> ${file!.path}');
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
                          // file = await context
                          //     .read<UserCubit>()
                          //     .getProfileImage(ImageSource.camera);
                          // file = await getImage(ImageSource.camera);
                          // context.read<UserCubit>().uploadPhoto(
                          //       token: token,
                          //       id: user.id!,
                          //       file: file!,
                          //     );

                          //Navigator.pop(context);
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
}
