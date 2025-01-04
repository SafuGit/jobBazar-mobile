import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        selectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
        unselectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
        items: const [ 
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 40),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 40),
            label: "Profile",
          )
        ],

        onTap: (int index) {
          switch (index) {
            case 0:
              if (authProvider.userType == "USER") {
                Navigator.pushNamed(context, '/userHome');
                break;
              }
              else if (authProvider.userType == "EMPLOYER") {
                Navigator.pushNamed(context, '/employerHome');
                break;
              }
            case 1:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      );
  }
}