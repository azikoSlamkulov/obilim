import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repo.dart';

class GetAllUsers extends UseCase<List<UserEntity>, GetAllUsersParams> {
  final UserRepo userRepo;
  GetAllUsers(this.userRepo);

  @override
  Future<Either<Failure, List<UserEntity>>> call(
      GetAllUsersParams params) async {
    return await userRepo.getAllUsers(
      token: params.token,
    );
  }
}

class GetAllUsersParams extends Equatable {
  final String token;

  const GetAllUsersParams({required this.token});

  @override
  List<Object?> get props => [token];
}
