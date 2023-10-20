import 'package:dartz/dartz.dart';
import 'package:obilim/src/core/error/error.dart';

import '../entities/token_entity.dart';

abstract class AuthRepo {
  // Token
  Future<Either<Failure, String?>> getToken();

  // Sign Up
  Future<Either<Failure, String>> signUp({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String type,
  });

  // Sign In
  Future<Either<Failure, String>> signInWithGoogle();

  Future<Either<Failure, String>> signInWithFacebook();

  Future<Either<Failure, String>> signInWithEmail({
    required String userName,
    required String password,
  });

  // Sign Out
  Future<Either<Failure, bool>> signOut();
}
