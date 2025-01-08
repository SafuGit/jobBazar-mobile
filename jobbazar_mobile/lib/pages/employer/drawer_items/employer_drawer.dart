import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/shared/theme/employer/employer_gradient.dart';
import 'package:jobbazar_mobile/shared/theme/employer/theme.dart';
import 'package:jobbazar_mobile/shared/pages/args/paid_plans_args.dart';

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
            Navigator.pushReplacementNamed(context, '/employer/allJobs');
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
            Navigator.pushReplacementNamed(context, '/paidPlans', arguments: PaidPlansArgs(theme: employerTheme, gradient: employerDecoration));
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.notifications, size: 50,),
          title: const Text('Hiring Tips', style: TextStyle(fontSize: 30)),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/employer/hiringTips');
          },
        ),
        // const Divider(),
      ],
    );
  }
}