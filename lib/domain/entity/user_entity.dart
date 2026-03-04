import 'package:gestard/core/enums.dart';

class UserEntity {
  final int id ;
  final String fullName;
  final String email;
  final UserRole role;

  UserEntity({
    required this.id, required this.fullName, required this.email, required this.role,

  });
}