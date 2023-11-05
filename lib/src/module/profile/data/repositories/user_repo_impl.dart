import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:obilim/src/core/error/error.dart';

import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';
import 'package:obilim/src/module/profile/domain/entities/user_photo_entity.dart';

import '../../../auth/data/datasource/local_auth_data.dart';
import '../../domain/entities/image_entity.dart';
import '../../domain/repositories/user_repo.dart';
import '../datasources/remote_user_data.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl({
    required this.localAuth,
    required this.remoteUser,
  });

  final LocalAuthData localAuth;
  final RemoteUserData remoteUser;

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers({
    required String token,
  }) async {
    try {
      //final tokenFromCache = localAuth.getTokenFromCache();

      final allUsers = await remoteUser.getAllUsers(
        //tokenFromCache: tokenFromCache!.token!,
        token: token,
      );

      return Right(allUsers);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> editUser({
    required String token,
    required int id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String birthDate,
  }) async {
    try {
      //final tokenFromCache = localAuth.getTokenFromCache();

      final user = await remoteUser.editUser(
        token: token,
        id: id,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
      );

      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser({required String token}) async {
    try {
      final user = await remoteUser.getUser(
        token: token,
      );

      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failure, String>> getUserImage({required String token}) async {
  //   try {
  //     final userImage = await remoteUser.getUserPhoto(
  //       token: token,
  //     );

  //     return Right(userImage);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  @override
  Future<Either<Failure, UserPhotoEntity>> uploadUserPhoto({
    required String token,
    required int userID,
    required File file,
  }) async {
    try {
      final user = await remoteUser.uploadUserPhoto(
        token: token,
        userID: userID,
        file: file,
      );

      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
