import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repo.dart';

class GetUser extends UseCase<UserEntity, GetUserParams> {
  final UserRepo userRepo;

  GetUser(this.userRepo);

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) async {
    return await userRepo.getUser(
      token: params.token,
    );
  }
}

class GetUserParams extends Equatable {
  final String token;

  const GetUserParams({required this.token});

  @override
  List<Object?> get props => [token];
}
