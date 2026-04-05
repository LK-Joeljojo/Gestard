import 'package:gestard/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<void> createUser(UserEntity userEntity) async {  
  }
}
