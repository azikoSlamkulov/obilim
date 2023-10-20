import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? birthDate;
  final String? type;
  final String? userPhoto;

  const UserEntity({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
    this.type,
    this.userPhoto,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        firstName,
        lastName,
        phoneNumber,
        birthDate,
        type,
        userPhoto,
      ];
}
