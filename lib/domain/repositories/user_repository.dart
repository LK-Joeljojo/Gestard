import 'package:gestard/domain/entity/user_entity.dart';

abstract class UserRepository {
  // creer la fonction createUser dans UserRepository
  Future<void> createUser(UserEntity userEntity) ;
  // creer la fonction getAllUser dans UserRepository
  Future<List<UserEntity>> getAllUser();
  
}
// creer la fonction getAllUser dans UserRepository impl dans userRepositoryImpl
// ensuite la function login et getAllusers dans usecase pour enfin l'utiliser dans 
// AuthViewModel que je vais creer apres 
// qui contiendra les function login et register 