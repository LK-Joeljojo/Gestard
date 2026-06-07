import 'package:gestard/presentation/authentication/view_model/user_auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/enums.dart';
import '../../../domain/uses_cases/user_use_case.dart';

// Provider de UserAuthViewModel
final userAuthViewModelProvider =
    StateNotifierProvider<UserAuthViewModel, UserAuthState>(
      (ref) => UserAuthViewModel(ref.read(userUseCaseProvider)),
    );

class UserAuthViewModel extends StateNotifier<UserAuthState> {
  // dependance de userUseCase
  final UserUseCase userUseCase;
  // constructeur de UserAuthViewModel
  UserAuthViewModel(this.userUseCase)
    : // initialiser l'etat de UserAuthState a l'etat initial
      super(UserAuthState());
  // fonction pour register user
  Future<void> register({
    required String fullName,
    required String email,
    required int phoneNumber,
    required String password,
    required UserRole role,
  }) async {
    // mettre l'etat de chargement a true et effacer les messages d'erreur
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      // appeler la fonction register du userUseCase pour enregistrer l'utilisateur
      await userUseCase.register(fullName, email, phoneNumber, password, role);
      // si l'enregistrement est reussi, mettre isAuthenticated a true
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    } catch (e) {
      // si une erreur se produit, mettre le message d'erreur dans l'etat
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
  // fonction pour nettoyer l'etat

  void cleanState() {
    state = UserAuthState();
  }

  // fonction pour login user
  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final user = await userUseCase.login(email, password);
      state = state.copyWith(
        isAuthenticated: true,
        isLoading: false,
        userId: user.id,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}
