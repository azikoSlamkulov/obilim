import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final String? token;
  //final UserEntity? user;

  const TokenEntity({
    this.token,
    //this.user,
  });

  @override
  List<Object?> get props => [
        token,
        //user,
      ];
}
