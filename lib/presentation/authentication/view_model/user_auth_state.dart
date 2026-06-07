
class UserAuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? errorMessage;
  final int? userId;
// constructeur de UserAuthState
  UserAuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.errorMessage,
    this.userId,
  });
  // fonction copyWith pour copier l'etat actuel et
  // le modifier avec les nouvelles valeurs
  UserAuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? errorMessage,
    int? userId,


  }) {
    // retourne une nouvelle instance de UserAuthState avec les nouvelles valeursv
    return UserAuthState(
      isAuthenticated:  isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      userId: userId ?? this.userId
    );
  }
}
