import 'package:go_router/go_router.dart';

import '../../pages/home_screen.dart';
import '../../pages/main_screen.dart';

final GoRouter router = GoRouter(
    initialLocation: '/start',
    routes: [
      GoRoute(
        path: '/start',
        builder: (context, state) => const HomePageScreen(),
      ),
      GoRoute(
        path: '/main', 
        builder: (context, state) => const MainScreen(),
      )
    ],
  );

