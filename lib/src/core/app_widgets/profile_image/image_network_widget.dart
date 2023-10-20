import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../module/profile/domain/entities/user_entity.dart';

class ImageNetworkWidget extends StatelessWidget {
  ImageNetworkWidget({
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

  // String imageUrl =
  //     'http://85.113.29.26:8080/api/v1/user/photo/${user.userPhoto}';
  //Map<String, String>? headers = {'Authorization': 'Bearer $token'};

  @override
  Widget build(BuildContext context) {
    log('token ===>>> $token');
    return Image.network(
      //imageUrl,
      'http://85.113.29.26:8080/api/v1/user/photo/${user.userPhoto}',
      headers: {'Authorization': 'Bearer $token'},
      height: 100.h,
      width: 100.h,
      //frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
    );
  }
}
