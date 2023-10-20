import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/error/error.dart';
import '../../../domain/entities/image_entity.dart';
import '../../../domain/entities/user_photo_entity.dart';
import '../../../domain/usecases/get_user_image.dart';
import '../../../domain/usecases/upload_user_image.dart';

part 'profile_image_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  final UploadUserImage uploadUserPhoto;
  //final GetUserImage getUserPhoto;
  ProfileImageCubit({
    required this.uploadUserPhoto,
    //required this.getUserPhoto,
  }) : super(UserImageLoading());

  void uploadUserImage({
    required String token,
    required int id,
    required File file,
  }) async {
    emit(UserImageLoading());
    final user = await uploadUserPhoto.call(
      UploadUserPhotoParams(
        token: token,
        userID: id,
        file: file,
      ),
    );
    user.fold(
      (error) => emit(UserImageFailure(message: _mapFailureToMessage(error))),
      (user) {
        //log('user ===>>> $user');
        emit(UserPhotoLoaded(user));
      },
    );
  }

  // void getUserImage({
  //   required String token,
  // }) async {
  //   emit(UserImageLoading());
  //   final userImage = await getUserPhoto.call(
  //     GetUserImageParams(
  //       token: token,
  //     ),
  //   );
  //   userImage.fold(
  //     (error) => emit(UserImageFailure(message: _mapFailureToMessage(error))),
  //     (userImage) {
  //       //log('user ===>>> $user');
  //       emit(UserImageLoaded(userImage));
  //     },
  //   );
  // }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
