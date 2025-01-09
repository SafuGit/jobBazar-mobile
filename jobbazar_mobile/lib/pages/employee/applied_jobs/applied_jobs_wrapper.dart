import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/application_provider.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/provider/job_provider.dart';
import 'package:jobbazar_mobile/provider/models/job.dart';
import 'package:jobbazar_mobile/shared/appbar.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';
import 'package:jobbazar_mobile/shared/theme/employee/employee_gradient.dart';
import 'package:jobbazar_mobile/shared/util/card/card_list.dart';
import 'package:jobbazar_mobile/shared/util/heading_text.dart';
import 'package:provider/provider.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  List<Job> jobs = [];
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final applicationProvider = Provider.of<ApplicationProvider>(context, listen: false);
      final jobProvider = Provider.of<JobProvider>(context, listen: false);

      applicationProvider.fetchApplicationByUserId(authProvider.currentUser!.id);

      final applications = applicationProvider.applications;

      Future.wait(applications.map((application) async {
        final job = await jobProvider.fetchJobById(application.job_id);
        if (job != null) {
          jobs.add(job);
        }
      })).then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (jobs != []) {
      return Scaffold(
        appBar: SharedAppBar(title: "JobBazar Mobile - Applied Jobs", color: Theme.of(context).colorScheme.primary,),
        drawer: const AppDrawer(),
        bottomNavigationBar: const BottomNav(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: employeeDecoration,
          child: Column(
            children: [
              HeadingText(title: "Applied Jobs", subtitle: "${jobs.length} Jobs Found",),
              CardList(jobs: jobs),
            ]
          )
        ),
      );
    }
    else {
      return const CircularProgressIndicator(
        backgroundColor: Colors.black,
      );
    }
  }
}