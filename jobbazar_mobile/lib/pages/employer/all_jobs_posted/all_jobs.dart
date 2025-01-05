import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/pages/employer/theme.dart';
import 'package:jobbazar_mobile/provider/job_provider.dart';
import 'package:jobbazar_mobile/shared/appbar.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';
import 'package:jobbazar_mobile/shared/util/card/card_list.dart';
import 'package:jobbazar_mobile/shared/util/heading_text.dart';
import 'package:provider/provider.dart';

class AllJobsPage extends StatelessWidget {
  const AllJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    JobProvider jobProvider = Provider.of<JobProvider>(context);
    jobProvider.fetchJobs();

    final jobs = jobProvider.jobs.reversed.toList();
    return Theme(
      data: employerTheme, 
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: SharedAppBar(title: "JobBazar Mobile - All Jobs", color: Theme.of(context).colorScheme.primary),
            drawer: const AppDrawer(),
            bottomNavigationBar: const BottomNav(),
            body: Column(
              children: [
                const HeadingText(title: "All Jobs Posted",),
                CardList(jobs: jobs,),
              ]
            )
          );
        }
      )
    );
  }
}