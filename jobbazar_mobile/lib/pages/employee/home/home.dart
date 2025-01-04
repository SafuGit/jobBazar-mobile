// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/pages/employee/home/job_args.dart';
import 'package:jobbazar_mobile/pages/employee/home/job_info.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/provider/job_provider.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';
import 'package:jobbazar_mobile/shared/util/card_list.dart';
import 'package:jobbazar_mobile/shared/util/heading_text.dart';
import 'package:provider/provider.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({super.key, required this.title});

  final String title;

  @override
  State<EmployeeHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<EmployeeHomeScreen> {

    // @override
    // void initState() {
    //   super.initState();
    //   jobProvider.fetchJobs();
    //   testText = "Fetching jobs...";
    // }


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final jobProvider = Provider.of<JobProvider>(context);
    jobProvider.fetchJobs();

    final currentUser = authProvider.currentUser;
    final jobs = jobProvider.jobs.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeadingText(userName: currentUser?.name, jobLength: jobs.length),
            CardList(jobs: jobs),

          ],
        ),
      ),

      drawer: const AppDrawer(),

      bottomNavigationBar: const BottomNav()
    );
  }
}