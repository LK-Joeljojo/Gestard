import 'package:gestard/core/enums.dart';

class UserEntity {
  final int id;
  final String fullName;
  final String email;
  final int phoneNumber;
  final String password;
  final UserRole role;

  UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.password,
    required this.phoneNumber,
  });
}
