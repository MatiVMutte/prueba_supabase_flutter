import 'package:go_router/go_router.dart';
import 'package:prueba_flutte/presentation/home_screen.dart';

import 'package:prueba_flutte/presentation/screens/auth/login_screen.dart';

final appRouter = GoRouter(
    initialLocation: '/',
    routes: [
    
        GoRoute(
          path: '/',
          name: LoginScreen.name,
          builder: ( context, state ) => LoginScreen(),
        ),
        
        GoRoute(
          path: '/home',
          name: HomeScreen.name,
          builder: ( context, state ) => HomeScreen(),
        ),
        
    ]
);