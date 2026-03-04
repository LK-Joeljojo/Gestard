import 'package:gestard/core/enums.dart';
import 'package:gestard/domain/entity/user_entity.dart';
import 'package:isar/isar.dart';
part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  late String email;
  late String fullName;

  @enumerated
  late UserRole role;

  DateTime createdAt = DateTime.now();
  DateTime updateAt = DateTime.now();
}

UserEntity toEntity(User model) {
  return UserEntity(
    id: model.id,
    fullName: model.fullName,
    email: model.email,
    role: model.role,
  );
}
