import 'package:blueprint_4app/src/app%20routing/cupertino_page_transition.dart';
import 'package:go_router/go_router.dart';
import '../../pages/auth/auth_page.dart';
import '../../pages/hive_box.dart';

import '../../pages/start_page.dart';
import '../../pages/settings_page.dart';
import '../../pages/textfield_page.dart';
import '../services/service_locator_get_it.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'AuthPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AuthPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/start_page',
        name: 'StartPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const StartPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/start_page/settings',
        name: 'SettingsPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SettingsPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/start_page/new_screen',
        name: 'TextFieldPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const TextFieldPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/start_page/hive_box',
        name: 'HiveBoxPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: HiveBoxPage(box: DIServiceLocator.instance.personBox),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
