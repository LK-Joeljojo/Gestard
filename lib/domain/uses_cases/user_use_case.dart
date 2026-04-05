import 'package:gestard/data/repositories/user_repository_impl.dart';
import 'package:gestard/domain/entity/user_entity.dart';
import 'package:gestard/domain/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// provider pour userusecase

final userUseCaseProvider = Provider<UserUseCase>(
  (ref) => UserUseCase(ref.read(userRepositoryProvider)),
);

class UserUseCase {
  UserUseCase(this.userRepository);
  final UserRepository userRepository;

  //create user
  Future<void> createUser(UserEntity user) async {
    return userRepository.createUser(user);
  }
}
