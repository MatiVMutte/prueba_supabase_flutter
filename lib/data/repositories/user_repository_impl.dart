import 'package:prueba_flutte/domain/datasources/user_datasource.dart';
import 'package:prueba_flutte/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {

  final UserDataSource userDatasourceImpl;

  UserRepositoryImpl(this.userDatasourceImpl);

  @override
  Future<bool> signInWithCredentials({required String email, required String password}) async {
    return userDatasourceImpl.signInWithCredentials(email: email, password: password);
  }

  @override
  Future<bool> signInWithGoogle() async {
    return userDatasourceImpl.signInWithGoogle();
  }

  @override
  Future<bool> signOut() async {
    return userDatasourceImpl.signOut();
  }

  @override
  Future<bool> signUp({required String name, required String email, required String password}) async {
    return userDatasourceImpl.signUp(name: name, email: email, password: password);
  }

}