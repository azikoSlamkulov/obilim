import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obilim/src/module/auth/domain/entities/token_entity.dart';

import '../../../module/profile/domain/entities/user_entity.dart';
import '../../data/remote/api/base_api.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  CachedNetworkImageWidget({
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

  @override
  Widget build(BuildContext context) {
    log('token ===>>> $token');
    return CachedNetworkImage(
      imageUrl: '${BaseAPI.userPhoto}${user.userPhoto}',
      httpHeaders: {
        "Authorization": "Bearer $token",
      },
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      //fadeOutDuration: Duration(seconds: 5),
      imageBuilder: (context, imageProvider) => Container(
        height: 100.h,
        width: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          image: DecorationImage(
            image: imageProvider,
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
      errorWidget: (context, url, error) => Container(
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
      ),
    );
  }
}
