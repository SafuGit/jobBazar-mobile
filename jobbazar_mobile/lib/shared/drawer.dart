import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/shared/wrapper/drawer_wrapper.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final String title;

    if (authProvider.userType == "USER") {
      title = "Employee Dashboard";
    }
    else if (authProvider.userType == "EMPLOYER") {
      title = "Employer Dashboard";
    }
    else {
      title = "Dashboard";
    }

    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          
          // const UserDrawerItems(),
          const DrawerWrapper(),
          const Divider(),

          // Spacer pushes the logout tile to the bottom
          const Spacer(),
          
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, size: 50),
            iconColor: const Color.fromARGB(255, 255, 0, 0),
            textColor: const Color.fromARGB(255, 255, 0, 0),
            title: const Text('Logout', style: TextStyle(fontSize: 30)),
            onTap: () {
              authProvider.logout(context);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}