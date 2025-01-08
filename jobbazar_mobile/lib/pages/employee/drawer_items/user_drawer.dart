import 'package:flutter/material.dart';

class UserDrawerItems extends StatelessWidget {
  const UserDrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.edit_document, size: 50,),
          title: const Text('CV Info', style: TextStyle(fontSize: 30)),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/employee/cvInfo');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.work, size: 50,),
          title: const Text('Applied Jobs', style: TextStyle(fontSize: 30)),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/employee/appliedJobs');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.attach_money, size: 50,),
          title: const Text('Paid Plans', style: TextStyle(fontSize: 30)),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/paidPlans');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.notifications, size: 50,),
          title: const Text('Notifications', style: TextStyle(fontSize: 30)),
          onTap: () {
            // Update the state of the app
            // ...
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.school, size: 50,),
          title: const Text('Courses', style: TextStyle(fontSize: 30)),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/employee/learning');
          },
        ),
      ],
    );
  }
}
