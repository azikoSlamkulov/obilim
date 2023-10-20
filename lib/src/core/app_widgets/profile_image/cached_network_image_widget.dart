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
      imageUrl: 'http://85.113.29.26:8080/api/v1/user/photo/${user.userPhoto}',
      httpHeaders: {
        "Authorization": "Bearer $token",
      },
      // height: 100.h,
      // width: 100.h,
      // placeholder: (context, url) => const Center(
      //   child: CircularProgressIndicator(),
      // ),
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
    // return SizedBox(
    //   height: 110.h,
    //   width: 110.h,
    //   child: CachedNetworkImage(
    //     imageUrl: 'http://85.113.29.26:8080/api/v1/user/photo',
    //     httpHeaders: {
    //       "Authorization": "Bearer $token",
    //     },
    //     // placeholder: (context, url) => const Center(
    //     //   child: CircularProgressIndicator(),
    //     // ),
    //     //fadeOutDuration: Duration(seconds: 5),
    //     imageBuilder: (context, imageProvider) => Container(
    //       height: 100.h,
    //       width: 100.h,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: Colors.red,
    //         image: DecorationImage(
    //           image: imageProvider,
    //           fit: BoxFit.cover,
    //         ),
    //         boxShadow: const [
    //           BoxShadow(
    //             color: Colors.white,
    //             spreadRadius: 3,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   // child: Stack(
    //   //   children: [
    //   //     Container(
    //   //       // borderRadius: BorderRadius.circular(8.0),
    //   //       height: 100.h,
    //   //       width: 100.h,

    //   //       decoration: BoxDecoration(
    //   //         borderRadius: BorderRadius.circular(10),
    //   //         color: Colors.red,
    //   //         image: DecorationImage(
    //   //           image: NetworkImage(
    //   //             'http://85.113.29.26:8080/api/v1/user/photo',
    //   //             headers: {'Authorization': 'Bearer $token'},
    //   //           ),
    //   //           fit: BoxFit.cover,
    //   //         ),
    //   //         boxShadow: const [
    //   //           BoxShadow(
    //   //             color: Colors.white,
    //   //             spreadRadius: 3,
    //   //           ),
    //   //         ],
    //   //       ),
    //   //     ),
    //   //     Positioned(
    //   //       bottom: 1,
    //   //       right: 2,
    //   //       child: InkWell(
    //   //         onTap: () async {
    //   //           file = await getImage(ImageSource.camera);
    //   //           // context.read<UserCubit>().uploadPhoto(
    //   //           //       token: token,
    //   //           //       id: user.id!,
    //   //           //       file: file!,
    //   //           //     );
    //   //         },
    //   //         child: const FaIcon(
    //   //           FontAwesomeIcons.plusCircle,
    //   //           size: 25,
    //   //           color: Colors.red,
    //   //           // imageUrl!.isNotEmpty ? AppColors.mainColor : AppColors.blue,
    //   //         ),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // ),
    // );
  }
}

// class CircleProfileWidget extends StatelessWidget {
//   const CircleProfileWidget({
//     required this.onTap,
//     this.imageUrl,
//     this.icon,
//     Key? key,
//   }) : super(key: key);

//   final VoidCallback onTap;
//   final String? imageUrl;
//   final IconData? icon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(40.0),
//       decoration: BoxDecoration(
//         color: AppColors.bgColorCircleProfile,
//         shape: BoxShape.circle,
//         border: imageUrl!.isNotEmpty
//             ? Border.all(style: BorderStyle.none)
//             : Border.all(color: AppColors.blue),
//       ),
//       child: Stack(
//         children: [
//           if (imageUrl!.isNotEmpty)
//             CircleAvatar(
//               radius: 60,
//               backgroundImage: NetworkImage(imageUrl!),
//             )
//           else
//             Padding(
//               padding: const EdgeInsets.all(34.0),
//               child: FaIcon(
//                 icon,
//                 size: 60,
//                 color: AppColors.blue,
//               ),
//             ),
//           Positioned(
//             bottom: 3,
//             right: 2,
//             child: InkWell(
//               onTap: onTap,
//               child: FaIcon(
//                 FontAwesomeIcons.plusCircle,
//                 size: 30,
//                 color:
//                     imageUrl!.isNotEmpty ? AppColors.mainColor : AppColors.blue,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
