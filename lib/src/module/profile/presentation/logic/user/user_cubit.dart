import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';
import 'package:obilim/src/module/profile/domain/entities/user_photo_entity.dart';

import '../../../../../core/error/error.dart';
import '../../../../profile/domain/usecases/get_all_users.dart';
import '../../../domain/usecases/edit_user.dart';
import '../../../domain/usecases/get_user.dart';
import '../../../domain/usecases/upload_user_image.dart';

part 'user_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class UserCubit extends Cubit<UserState> {
  final GetAllUsers getAllUsers;
  final GetUser getUser;
  final EditUser editUser;
  final UploadUserImage uploadUserPhoto;
  UserCubit({
    required this.getAllUsers,
    required this.getUser,
    required this.editUser,
    required this.uploadUserPhoto,
  }) : super(UserLoading());

  void getUsers({required String token}) async {
    final userList = await getAllUsers.call(
      GetAllUsersParams(
        token: token,
      ),
    );
    userList.fold(
      (error) => emit(UserFailure(message: _mapFailureToMessage(error))),
      (user) {
        emit(AllUsersLoaded(user));
      },
    );
  }

  void getCurentUser({required String token}) async {
    final user = await getUser.call(
      GetUserParams(
        token: token,
      ),
    );
    user.fold(
      (error) => emit(UserFailure(message: _mapFailureToMessage(error))),
      (user) {
        emit(UserLoaded(user));
      },
    );
  }

  void editCurentUser({
    required String token,
    required int id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String birthDate,
  }) async {
    emit(UserLoading());
    final user = await editUser.call(
      EditUserParams(
        token: token,
        id: id,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
      ),
    );
    user.fold(
      (error) => emit(UserFailure(message: _mapFailureToMessage(error))),
      (user) {
        emit(UserLoaded(user));
      },
    );
  }

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

  // Future<XFile> getProfileImage(ImageSource imageSource) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: imageSource);
  //   //profileImageFile.value = image!.path;
  //   return image!;
  // }

  void uploadPhoto({
    required String token,
    required int id,
    required File file,
  }) async {
    emit(UserLoading());
    final user = await uploadUserPhoto.call(
      UploadUserPhotoParams(
        token: token,
        userID: id,
        file: file,
      ),
    );
    user.fold(
      (error) => emit(UserFailure(message: _mapFailureToMessage(error))),
      (user) {
        log('user ===>>> $user');
        emit(UserPhotoLoaded(user));
      },
    );
  }

  //Future<XFile> uploadProfileImage(ImageSource imageSource) async {}
}
