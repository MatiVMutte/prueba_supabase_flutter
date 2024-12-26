import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_flutte/presentation/providers/auth/user_provider.dart';

class HomeScreen extends ConsumerWidget {

  static const name = "/home";

  const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isSignIn = ref.watch( userSignInProvider );

    if( isSignIn == false ) {
      context.go('/');
    }

    return Scaffold(

      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              ref.read(userSignInProvider.notifier).signOut();
            },
          ),
        ],
      ),

    );
  }
}