import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/pages/login/login.dart';
import 'package:jobbazar_mobile/pages/register/register.dart';
import 'package:jobbazar_mobile/pages/home/home.dart'; // Assume a home page exists
import 'package:provider/provider.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.isAuthenticated) {
      // Navigate to the Home page if authenticated
      return const HomeScreen(title: 'JobBazar Mobile - Home',);
    } else {
      // Navigate to Login page if not authenticated
      return const LoginScreen();
    }
  }
}

var appRoutes = {
  '/': (context) => const Wrapper(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/home': (context) => const HomeScreen(title: 'JobBazar Mobile - Home',), // Protected route
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final authProvider = Provider.of<AuthProvider>(navigatorKey.currentContext!);

  if (settings.name == '/home' && !authProvider.isAuthenticated) {
    // Redirect unauthenticated users to login
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  // Default routes
  return MaterialPageRoute(
    builder: (context) => appRoutes[settings.name]!(context),
  );
}
