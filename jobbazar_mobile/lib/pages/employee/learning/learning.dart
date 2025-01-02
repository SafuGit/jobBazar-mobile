import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/shared/appbar.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.orange,
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [ 
                  Card(
                    shadowColor: Colors.black,
                    elevation: 20,
                    child: ListTile(
                      title: Text("Learning 1"),
                      subtitle: Text("This is the first learning"),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.black,
                    elevation: 20,
                    child: ListTile(
                      title: Text("Learning 2"),
                      subtitle: Text("This is the second learning"),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.black,
                    elevation: 20,
                    child: ListTile(
                      title: Text("Learning 3"),
                      subtitle: Text("This is the third learning"),
                    ),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),

      appBar: SharedAppBar(title: "JobBazar Mobile - Courses", color: Theme.of(context).colorScheme.primary), // This is the change

      drawer: const AppDrawer(),

      bottomNavigationBar: const BottomNav()
    );
    
  }
}