import 'dart:developer';
import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../../domain/entities/token_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasource/local_auth_data.dart';
import '../datasource/remote_auth_data.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required this.remoteAuth,
    required this.localAuth,
  });

  final RemoteAuthData remoteAuth;
  final LocalAuthData localAuth;

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final tokenFromCache = localAuth.getTokenFromCache();

      if (tokenFromCache != null) {
        log('Token =====>>>>> tokenFromCache');
        return Right(tokenFromCache.token);
      } else {
        final tokenFromServer = await remoteAuth.getTokenFromServer();
        if (tokenFromServer != null) {
          log('Token =====>>>>> tokenFromServer');

          return Right(tokenFromServer.token);
        }
      }
      log('Token =====>>>>> NULL');
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> signUp({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String type,
  }) async {
    try {
      final token = await remoteAuth.signUp(
        username: username,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        type: type,
      );
      localAuth.addTokenToCache(token);
      log('cach ====>>>>>   token saved to cache');
      return Right(token.token!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> signInWithEmail(
      {required String userName, required String password}) async {
    try {
      final token = await remoteAuth.signInWithEmail(
        userName: userName,
        password: password,
      );
      localAuth.addTokenToCache(token);
      log('cach ====>>>>>   token saved to cache');
      return Right(token.token!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      final token = await remoteAuth.signInWithGoogle();
      localAuth.addTokenToCache(token);
      log('cach ====>>>>>   token saved to cache');
      return Right(token.token!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> signInWithFacebook() async {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await remoteAuth.signOut();
      await localAuth.clearCache();
      log('cach =====>>>>>   cach cleared');
      return const Right(true);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
