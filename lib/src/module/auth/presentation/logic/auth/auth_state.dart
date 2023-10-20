part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class UnAuthenticatedState extends AuthState {}

class AuthenticatedState extends AuthState {
  final String token;
  const AuthenticatedState(this.token);
  @override
  List<Object> get props => [token];
}

class AuthenticatedAdminState extends AuthState {
  final String token;
  const AuthenticatedAdminState(this.token);
  @override
  List<Object> get props => [token];
}

class SignUpState extends AuthState {
  final String token;
  const SignUpState(this.token);
  @override
  List<Object> get props => [token];
}

class AuthenticationFailureState extends AuthState {
  final String message;
  const AuthenticationFailureState({required this.message});
  @override
  List<Object> get props => [message];
}

// class OtpVerificationState extends AuthState {
//   final String phoneNumber;
//   const OtpVerificationState(this.phoneNumber);
//   @override
//   List<Object> get props => [phoneNumber];
// }

// class LinkOtpVerificationState extends AuthState {
//   final String phoneNumber;
//   const LinkOtpVerificationState(this.phoneNumber);
//   @override
//   List<Object> get props => [phoneNumber];
// }
