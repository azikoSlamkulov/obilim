import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../module/profile/domain/entities/user_entity.dart';
import '../../../module/profile/presentation/logic/user/user_cubit.dart';
import '../../../module/profile/presentation/logic/user_image/profile_image_cubit.dart';

class NetworkImageWidget extends StatelessWidget {
  NetworkImageWidget({
    required this.token,
    required this.user,
    super.key,
  });

  final String token;
  final UserEntity user;

  File? file;
  String? profileImageFile;

  Future<File> getImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    profileImageFile = image!.path;
    File file = File(image.path);
    return file;
  }

  String imageUrl = 'http://85.113.29.26:8080/api/v1/user/photo';
  //Map<String, String>? headers = {'Authorization': 'Bearer $token'};

  @override
  Widget build(BuildContext context) {
    log('token ===>>> $token');
    return SizedBox(
      height: 110.h,
      width: 110.h,
      child: Stack(
        children: [
          user.userPhoto == null
              ? Container(
                  // borderRadius: BorderRadius.circular(8.0),
                  height: 100.h,
                  width: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                )
              : Container(
                  // borderRadius: BorderRadius.circular(8.0),
                  height: 100.h,
                  width: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                        'http://85.113.29.26:8080/api/v1/user/photo/${user.userPhoto}',
                        headers: {'Authorization': 'Bearer $token'},
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                ),
          Positioned(
            bottom: 1,
            right: 2,
            child: InkWell(
              onTap: () async {
                file = await getImage(ImageSource.camera);
                context.read<ProfileImageCubit>().uploadUserImage(
                      token: token,
                      id: user.id!,
                      file: file!,
                    );
              },
              child: const FaIcon(
                FontAwesomeIcons.plusCircle,
                size: 25,
                color: Colors.red,
                // imageUrl!.isNotEmpty ? AppColors.mainColor : AppColors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
