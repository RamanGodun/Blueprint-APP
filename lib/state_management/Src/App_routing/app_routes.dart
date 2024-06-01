import 'package:blueprint_4app/State_management/Src/App_routing/cupertino_page_transition.dart';
import 'package:go_router/go_router.dart';

import '../../../Pages/Auth_pages/auth_handler.dart';
import '../../../Pages/GPT_pages/api_key_page.dart';
import '../../../Pages/GPT_pages/send_prompt.dart';
import '../../../Pages/Others_pages/textfield_page.dart';
import '../../../Pages/SM _ages/hive_box.dart';
import '../../../Pages/settings_page.dart';
import '../../../Pages/start_page.dart';
import '../../Services/0.service_locator.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'AuthPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AuthHandler(),
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
      GoRoute(
        path: '/start_page/settings/enter_api_key',
        name: 'ApiKeyInputPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ApiKeyInputPage(),
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
        path: '/start_page/send_prompt',
        name: 'SendPromptPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SendPromptPage(),
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