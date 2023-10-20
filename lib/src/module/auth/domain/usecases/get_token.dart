import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/token_entity.dart';
import '../repositories/auth_repo.dart';

class GetToken {
  final AuthRepo authRepo;
  GetToken(this.authRepo);

  Future<Either<Failure, String?>> getToken() async {
    return await authRepo.getToken();
  }
}
