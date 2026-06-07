import 'package:gestard/core/enums.dart';
import 'package:gestard/core/hash_password.dart';
import 'package:gestard/data/repositories/user_repository_impl.dart';
import 'package:gestard/domain/entity/user_entity.dart';
import 'package:gestard/domain/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// Provider de userUseCase
final userUseCaseProvider = Provider<UserUseCase>(
  (ref) => UserUseCase(ref.read(userRepositoryProvider)),
);

class UserUseCase {
  UserUseCase(this.userRepository);
  // dependance de userRepository
  final UserRepository userRepository;

// register user
  Future<void> register(
    //int id,
    String fullName,
    String email,
    int phoneNumber,
    String password,
    UserRole role,
  ) async {
    // hasher le mot de passe avant de le sauvegarder
    final hash = HashPassword.hash(password);
    // creer une instance de user entity
    final user = UserEntity(
      id: 0,
      fullName: fullName,
      email: email,
      role: role,
      password: hash,
      phoneNumber: int.parse(phoneNumber.toString()),
    );
    // appeler la fonction createUser du userRepository pour 
    //sauvegarder les donnees
    await userRepository.createUser(user);
   
  }

  //login user
  Future<UserEntity> login( String email, String password) async {
    // get all user
    final users = await userRepository.getAllUser();
    // verifier si l'email et le mot de passe correspondent a un utilisateur
    // dans la liste des utilisateurs
    final user = users.firstWhere(
      (user) => user.email == email && HashPassword.verify(password, user.password),
      orElse: () => throw Exception('Mot de passe ou email incorrect'),
    );
     // si l'utilisateur est trouve, retourner l'utilisateur
    return user;
  }
}
