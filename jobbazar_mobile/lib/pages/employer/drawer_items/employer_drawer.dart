import 'package:flutter/material.dart';

class EmployerDrawerItems extends StatelessWidget {
  const EmployerDrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.edit_document, size: 50,),
          title: const Text('Job Postings', style: TextStyle(fontSize: 30)),
          onTap: () {
            // Update the state of the app
            // ...
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.assignment_turned_in_outlined, size: 50,),
          title: const Text('Applications', style: TextStyle(fontSize: 30)),
          onTap: () {
            // Update the state of the app
            // ...
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.attach_money, size: 50,),
          title: const Text('Paid Plans', style: TextStyle(fontSize: 30)),
          onTap: () {
            // Update the state of the app
            // ...
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.notifications, size: 50,),
          title: const Text('Hiring Tips', style: TextStyle(fontSize: 30)),
          onTap: () {
            // Update the state of the app
            // ...
          },
        ),
        // const Divider(),
      ],
    );
  }
}