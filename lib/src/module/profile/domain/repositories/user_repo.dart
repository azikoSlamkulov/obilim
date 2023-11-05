import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:obilim/src/module/profile/domain/entities/image_entity.dart';
import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';

import '../../../../core/error/error.dart';
import '../entities/user_photo_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, List<UserEntity>>> getAllUsers({
    required String token,
  });
  Future<Either<Failure, UserEntity>> getUser({required String token});
  Future<Either<Failure, UserEntity>> editUser({
    required String token,
    required int id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String birthDate,
  });
  Future<Either<Failure, UserPhotoEntity>> uploadUserPhoto({
    required String token,
    required int userID,
    required File file,
  });
  // Future<Either<Failure, String>> getUserImage({
  //   required String token,
  // });
}
