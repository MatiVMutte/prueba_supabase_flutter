abstract class UserDataSource {
  
  Future<bool> signUp({required String name, required String email, required String password});

  Future<bool> signInWithCredentials({required String email, required String password});

  Future<bool> signInWithGoogle();

  Future<bool> signOut();

}