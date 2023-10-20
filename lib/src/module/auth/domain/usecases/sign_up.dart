import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/token_entity.dart';
import '../repositories/auth_repo.dart';

class SignUp extends UseCase<String, SignUpParams> {
  final AuthRepo authRepo;

  SignUp(this.authRepo);

  @override
  Future<Either<Failure, String>> call(SignUpParams params) async {
    return await authRepo.signUp(
      username: params.username,
      email: params.email,
      password: params.password,
      firstName: params.firstName,
      lastName: params.lastName,
      type: params.type,
    );
  }
}

class SignUpParams extends Equatable {
  final String username;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String type;

  const SignUpParams({
    required this.username,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.type,
  });

  @override
  List<Object?> get props => [
        username,
        email,
        password,
        firstName,
        lastName,
        type,
      ];
}
