import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushNamed(context, '/userHome');
              break;
            case 1:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      );
  }
}