import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_photo_entity.dart';
import '../repositories/user_repo.dart';

class UploadUserPhoto extends UseCase<UserPhotoEntity, UploadUserPhotoParams> {
  final UserRepo userRepo;

  UploadUserPhoto(this.userRepo);

  @override
  Future<Either<Failure, UserPhotoEntity>> call(
      UploadUserPhotoParams params) async {
    return await userRepo.uploadUserPhoto(
      token: params.token,
      userID: params.userID,
      file: params.file,
    );
  }
}

class UploadUserPhotoParams extends Equatable {
  final String token;
  final int userID;
  final File file;

  const UploadUserPhotoParams({
    required this.token,
    required this.userID,
    required this.file,
  });

  @override
  List<Object?> get props => [
        token,
        userID,
        file,
      ];
}
