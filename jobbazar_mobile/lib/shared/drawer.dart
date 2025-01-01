import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/pages/employee/drawer_items/user_drawer.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              child: Center(
                child: Text(
                  'Employee Dashboard',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          const UserDrawerItems(),
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