import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_flutte/config/constants/environment.dart';
import 'package:prueba_flutte/config/router/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {

  await Supabase.initialize(
    url: Environment.apiURL,
    anonKey: Environment.apiKEY,
  );

  runApp(
    ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Prueba Supabase',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple.shade100
      ),
    );
  }
}
