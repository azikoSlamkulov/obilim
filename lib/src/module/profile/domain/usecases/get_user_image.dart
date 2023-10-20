// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:obilim/src/module/profile/domain/entities/user_entity.dart';

// import '../../../../core/error/error.dart';
// import '../../../../core/usecases/usecase.dart';
// import '../entities/image_entity.dart';
// import '../entities/user_photo_entity.dart';
// import '../repositories/user_repo.dart';

// class GetUserImage extends UseCase<String, GetUserImageParams> {
//   final UserRepo userRepo;

//   GetUserImage(this.userRepo);

//   @override
//   Future<Either<Failure, String>> call(GetUserImageParams params) async {
//     return await userRepo.getUserImage(
//       token: params.token,
//     );
//   }
// }

// class GetUserImageParams extends Equatable {
//   final String token;

//   const GetUserImageParams({
//     required this.token,
//   });

//   @override
//   List<Object?> get props => [
//         token,
//       ];
// }
