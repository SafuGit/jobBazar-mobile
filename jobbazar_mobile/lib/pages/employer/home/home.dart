import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/models/job.dart';
import 'package:jobbazar_mobile/shared/appbar2.dart';
import 'package:jobbazar_mobile/shared/theme/employer/employer_gradient.dart';
import 'package:jobbazar_mobile/shared/theme/employer/theme.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';
import 'package:jobbazar_mobile/shared/util/heading/employer_heading_buttons.dart';
import 'package:jobbazar_mobile/shared/util/jobs_accordion.dart';
import 'package:provider/provider.dart';

import '../../../provider/job_provider.dart';



class EmployerHomeScreen extends StatefulWidget {
  const EmployerHomeScreen({super.key});

  @override
  State<EmployerHomeScreen> createState() => _EmployerHomeScreenState();
}

class _EmployerHomeScreenState extends State<EmployerHomeScreen> {
  late List<Job> jobs = [];

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final jobProvider = Provider.of<JobProvider>(context, listen: false);
    jobProvider.fetchJobsByEmployer(userId: authProvider.currentUser?.id);
    jobs = jobProvider.employerJobs;
    debugPrint(jobs.toString());
  }

  @override
  Widget build(BuildContext context) {

    // debugPrint("${Theme.of(context).colorScheme.primary}");
    // debugPrint("${jobs[0].company}");
    // Use the Theme widget to apply employer theme to this screen only
    return Theme(
      data: employerTheme, // Apply the custom theme here
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: const Appbar2(),
            drawer: const AppDrawer(),
            bottomNavigationBar: const BottomNav(),
            body: Container(
              decoration: employerDecoration,
              child: Column(
                children: [
                  // HeadingText(title: "Welcome, ${authProvider.currentUser?.name}", subtitle: "Your Companies Posted Jobs", subtitle2: "${jobs.length} Jobs Found",),
                  const EmployerHeadingButtons(),
                  Builder(
                    builder: (context) {
                      if (jobs.isNotEmpty) {
                        return HotJobsAccordion(jobs: jobs);
                      } else {
                        return const Text("Loading");
                      }
                    }
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
