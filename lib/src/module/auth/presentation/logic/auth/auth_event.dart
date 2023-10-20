part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class GetTokenEvent extends AuthEvent {}

class SignInWithEmailEvent extends AuthEvent {
  final String userName;
  final String password;

  const SignInWithEmailEvent(this.userName, this.password);

  @override
  List<Object> get props => [userName, password];
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String type;

  const SignUpEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.type,
  });

  @override
  List<Object> get props => [
        username,
        email,
        password,
        firstName,
        lastName,
        type,
      ];
}

class SignOutEvent extends AuthEvent {}

//class RegistWithPhoneEvent extends AuthEvent {}



//class OpenSignInWithEmailEvent extends AuthEvent {}
