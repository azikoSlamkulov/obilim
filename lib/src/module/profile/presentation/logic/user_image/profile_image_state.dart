part of 'profile_image_cubit.dart';

abstract class ProfileImageState extends Equatable {
  const ProfileImageState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileImageState {}

final class UserImageLoading extends ProfileImageState {}

final class UserImageLoaded extends ProfileImageState {
  final String userImage;

  const UserImageLoaded(this.userImage);

  @override
  List<Object> get props => [userImage];
}

final class UserPhotoLoaded extends ProfileImageState {
  final UserPhotoEntity userPhoto;

  const UserPhotoLoaded(this.userPhoto);

  @override
  List<Object> get props => [userPhoto];
}

class UserImageFailure extends ProfileImageState {
  final String message;

  const UserImageFailure({required this.message});

  @override
  List<Object> get props => [message];
}
