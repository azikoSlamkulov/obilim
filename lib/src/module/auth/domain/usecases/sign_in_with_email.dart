import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/token_entity.dart';
import '../repositories/auth_repo.dart';

class SignInWithEmail extends UseCase<String, SignInWithEmailParams> {
  final AuthRepo authRepo;

  SignInWithEmail(this.authRepo);

  @override
  Future<Either<Failure, String>> call(SignInWithEmailParams params) async {
    return await authRepo.signInWithEmail(
      userName: params.userName,
      password: params.password,
    );
  }
}

class SignInWithEmailParams extends Equatable {
  final String userName;
  final String password;

  const SignInWithEmailParams({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}
