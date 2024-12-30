import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: Container(),

      drawer: const AppDrawer(),

      bottomNavigationBar: const BottomNav()
    );
  }
}