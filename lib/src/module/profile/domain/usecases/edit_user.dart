import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repo.dart';

class EditUser extends UseCase<UserEntity, EditUserParams> {
  final UserRepo userRepo;

  EditUser(this.userRepo);

  @override
  Future<Either<Failure, UserEntity>> call(EditUserParams params) async {
    return await userRepo.editUser(
      token: params.token,
      id: params.id,
      firstName: params.firstName,
      lastName: params.lastName,
      phoneNumber: params.phoneNumber,
      birthDate: params.birthDate,
    );
  }
}

class EditUserParams extends Equatable {
  final String token;
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthDate;

  const EditUserParams({
    required this.token,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.birthDate,
  });

  @override
  List<Object?> get props => [
        token,
        id,
        firstName,
        lastName,
        phoneNumber,
        birthDate,
      ];
}
