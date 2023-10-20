part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class AllUsersLoaded extends UserState {
  final List<UserEntity> allUsers;

  const AllUsersLoaded(this.allUsers);

  @override
  List<Object> get props => [allUsers];
}

final class UserLoaded extends UserState {
  final UserEntity user;

  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

final class UserPhotoLoaded extends UserState {
  final UserPhotoEntity userPhoto;

  const UserPhotoLoaded(this.userPhoto);

  @override
  List<Object> get props => [userPhoto];
}

class UserFailure extends UserState {
  final String message;

  const UserFailure({required this.message});

  @override
  List<Object> get props => [message];
}
