import 'package:flutter/material.dart';
import 'package:gym_statistics/features/home/ui/home_screen.dart';
import 'package:gym_statistics/shared_data/core/app_routes.dart';

class AppRouter {
  AppRouter() {}
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
      // case AppRoutes.settings:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SettingsPage();
      //     },
      //   );
    }
  }
  // MaterialPageRoute<dynamic> _routeError() {
  //   return MaterialPageRoute(
  //     builder: (_) {
  //       return const Scaffold(
  //         body: Center(
  //           child: Text('Route Error'),
  //         ),
  //       );
  //     },
  //   );
  // }
}
