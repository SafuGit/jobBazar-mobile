import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';
import 'package:provider/provider.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({super.key, required this.title});

  final String title;

  @override
  State<EmployeeHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<EmployeeHomeScreen> {


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final currentUser = authProvider.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(child: Text("Welcome, ${currentUser?.name}", style: const TextStyle(
              fontSize: 30,
            ),)),
            const Center(child: Text("Here are some Jobs", style: TextStyle(
              color: Color.fromARGB(255, 15, 82, 226),
              fontSize: 24
            ),))
          ],
        ),
      ),

      drawer: const AppDrawer(),

      bottomNavigationBar: const BottomNav()
    );
  }
}