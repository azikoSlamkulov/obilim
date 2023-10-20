import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/token_entity.dart';
import '../repositories/auth_repo.dart';

class SignInWithGoogle {
  final AuthRepo authRepo;

  SignInWithGoogle(this.authRepo);

  Future<Either<Failure, String>> signInWithGoogle() async {
    return await authRepo.signInWithGoogle();
  }
}
