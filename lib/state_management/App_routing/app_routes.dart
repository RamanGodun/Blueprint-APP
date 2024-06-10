import 'package:blueprint_4app/State_management/App_routing/cupertino_page_transition.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../UI_layout/PAGES/Auth_pages/auth_handler.dart';
import '../../UI_layout/PAGES/FI/2.results_screen.dart';
import '../../UI_layout/PAGES/FI/question_handler.dart';
import '../../UI_layout/PAGES/GPT_pages/api_key_page.dart';
import '../../UI_layout/PAGES/GPT_pages/send_prompt.dart';
import '../../UI_layout/PAGES/Others_pages/textfield_page.dart';
import '../../UI_layout/PAGES/DB_pages/hive_box.dart';
import '../../UI_layout/PAGES/0_MAIN/settings_page.dart';
import '../../UI_layout/PAGES/0_MAIN/start_page.dart';
import '../Services/_service_locator.dart';
import '../Models/models_4_FI_on_hive/model_4_hive.dart';

/*
Для уникнення ручного додавання кожного роуту, можна використовувати бібліотеки для кодогенерації роутів, наприклад auto_route.
 */
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
          final personBox = DIServiceLocator.instance.get<Box<Person>>();
          return CustomTransitionPage(
            key: state.pageKey,
            child: HiveBoxPage(box: personBox),
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
      GoRoute(
        path: '/start_page/question_handler',
        name: 'QuestionHandler',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const QuestionHandler(),
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
        path: '/start_page/question_handler/fi_results',
        name: 'ResultsScreen',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ResultsScreen(),
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
