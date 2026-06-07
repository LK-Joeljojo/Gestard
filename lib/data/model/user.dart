import 'package:gestard/core/enums.dart';
import 'package:gestard/domain/entity/user_entity.dart';
import 'package:isar/isar.dart';
part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  late String fullName;
  late String email;
  late int phoneNumber;
  late String password;

  @enumerated
  late UserRole role;

  DateTime createdAt = DateTime.now();
  DateTime updateAt = DateTime.now();
}

class UserMapper {
  //entity vers model
  static User toModel(UserEntity entity) {
    final model = User();
    // si l'id de l'entite n'est pas 0, assigner l'id au model
    if(entity.id != 0){
      model.id = entity.id;
    }
    model.fullName = entity.fullName;
    model.email = entity.email;
    model.phoneNumber = entity.phoneNumber;
    model.password = entity.password;
    model.role = entity.role;
    return model;
  }

  //model vers entity
  static UserEntity toEntity(User model) {
    return UserEntity(
      id: model.id,
      fullName: model.fullName,
      email: model.email,
      phoneNumber: model.phoneNumber,
      password: model.password,
      role: model.role,
    );
  }
}
