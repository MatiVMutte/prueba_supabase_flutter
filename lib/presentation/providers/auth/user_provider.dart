import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_flutte/domain/repositories/user_repository.dart';
import 'package:prueba_flutte/presentation/providers/user_repository_provider.dart';

final userSignInProvider = StateNotifierProvider<UserNotifier, AsyncValue<bool>>((ref) {

  final userRepository = ref.watch( userRepositoryProvider );

  return UserNotifier(userRepository: userRepository);
});

class UserNotifier extends StateNotifier<AsyncValue<bool>> {

  final UserRepository userRepository;

  UserNotifier({
    required this.userRepository
  }) : super(AsyncValue<bool>.data(false));

  Future<void> signInWithCredentials({required String email, required String password}) async {
    try {
      state = const AsyncValue.loading();
      final res = await userRepository.signInWithCredentials( email: email, password: password );
      state = AsyncValue.data(res);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> signOut() async {
    try {
      state = const AsyncValue.loading();
      final res = await userRepository.signOut();
      state = AsyncValue.data(res);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

}