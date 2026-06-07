import 'package:gestard/data/api/local/user_local_datasource.dart';
import 'package:gestard/data/model/user.dart';
import 'package:gestard/domain/entity/user_entity.dart';
import 'package:gestard/domain/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(userLocalDataSourceProvider)),
);

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLds;
  // contructeur
  UserRepositoryImpl(this.userLds);
  @override
  Future<void> createUser(UserEntity userEntity) async {
    //entity vers model
    final model = UserMapper.toModel(userEntity);
    //sauvegarder les donnees en local via userdatasource
    await userLds.createUser(model);
  }

  @override
  Future<List<UserEntity>> getAllUser() async {
    final model = await userLds.getAllUser();

    return model.map((e) => UserMapper.toEntity(e)).toList();
  }
}
