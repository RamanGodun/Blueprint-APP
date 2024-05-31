import 'package:blueprint_4app/src/App_routing/cupertino_page_transition.dart';
import 'package:go_router/go_router.dart';
import '../../pages/GPT_pages/api_key_page.dart';
import '../../pages/GPT_pages/send_prompt.dart';
import '../../pages/auth pages/auth_handler_widget.dart';
import '../../pages/SM _ages/hive_box.dart';
import '../../pages/start_page.dart';
import '../../pages/settings_page.dart';
import '../../pages/Others_pages/textfield_page.dart';
import '../../state_management/services/0.service_locator.dart';

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
