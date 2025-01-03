import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/shared/appbar.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';

// Define the Employer theme
final ThemeData employerTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
  primarySwatch: Colors.orange,
  // You can customize more properties if necessary.
);

class EmployerHomeScreen extends StatelessWidget {
  const EmployerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("${Theme.of(context).colorScheme.primary}");
    // Use the Theme widget to apply employer theme to this screen only
    return Theme(
      data: employerTheme, // Apply the custom theme here
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: SharedAppBar(
              title: "JobBazar Mobile - Employer Home", 
              color: Theme.of(context).colorScheme.primary, // Using the theme color
            ),
            drawer: const AppDrawer(),
            body: Center(
              child: Text(
                "Welcome to the Employer Home Screen ${Theme.of(context).colorScheme.primary}",
                style: const TextStyle(fontSize: 24),
              ),
            ),
          );
        }
      ),
    );
  }
}
