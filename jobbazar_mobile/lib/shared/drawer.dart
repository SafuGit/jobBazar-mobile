import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  child: Center(child: Text('Employee Dashboard', style: TextStyle(color: Colors.white, fontSize: 25))),
                ),
            ),

            ListTile(
              title: const Text('Item 1', style: TextStyle(fontSize: 30)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Item 2', style: TextStyle(fontSize: 30)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const Divider(),
          ],
        ),
      );
  }
}