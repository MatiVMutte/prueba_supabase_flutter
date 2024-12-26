import 'package:prueba_flutte/domain/datasources/user_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDatasourceImpl extends UserDataSource {

  final supabase = Supabase.instance.client;

  @override
  Future<bool> signInWithCredentials({required String email, required String password})  async{
    try {
      AuthResponse res = await supabase.auth.signInWithPassword(email: email, password: password);
      return res.user != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() async {
    try {
      await supabase.auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> signUp({required String name, required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}