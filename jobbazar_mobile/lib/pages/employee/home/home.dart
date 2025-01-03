// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/pages/employee/home/job_args.dart';
import 'package:jobbazar_mobile/pages/employee/home/job_info.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/provider/job_provider.dart';
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
            Center(child: Text("Welcome, ${currentUser?.name}", style: const TextStyle(
              fontSize: 30,
            ),)),
            const Center(child: Text("Here are some Jobs", style: TextStyle(
              color: Color.fromARGB(255, 15, 82, 226),
              fontSize: 24
            ),)),

            Text("${jobs.length} Jobs found", style: const TextStyle(
              fontSize: 20,
            ),),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 10,
                  // mainAxisSpacing: 10
                ),
                itemCount: jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  final job = jobs[index];
                  return Card(
                    shadowColor: Colors.black,
                    elevation: 20,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(job.title, style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                          ],
                        ),

                        const Divider(),

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/employee/jobInfo', arguments: JobArgs(title: job.title, description: job.description, location: job.location, salary: job.salary, company: job.company, jobType: job.type));
                                },
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.blue)
                                ), 
                                child: const Text("Get Info", style: TextStyle(color: Colors.black),)
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(Color.fromARGB(223, 233, 164, 60))
                              ), 
                              child: const Text("Apply", style: TextStyle(color: Colors.black),)
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),

      drawer: const AppDrawer(),

      bottomNavigationBar: const BottomNav()
    );
  }
}