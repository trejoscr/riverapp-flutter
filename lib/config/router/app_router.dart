import 'package:go_router/go_router.dart';
import 'package:river_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  //initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),

    GoRoute(
      path: '/state-provider',
      builder: (context, state) {
        return const StateProviderScreen();
      },
    ),

    GoRoute(
      path: '/future-provider',
      builder: (context, state) {
        return const PokemonScreen();
      },
    ),

    GoRoute(
      path: '/stream-provider',
      builder: (context, state) {
        return const StreamScreen();
      },
    ),

    GoRoute(
      path: '/state-notifier-provider',
      builder: (context, state) {
        return const TodosScreen();
      },
    )
  ],
);
