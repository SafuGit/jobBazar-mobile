import 'package:common_constants/common_constants.dart';
import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/pages/employer/applications/applications_table.dart';
import 'package:jobbazar_mobile/provider/application_provider.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/provider/job_provider.dart';
import 'package:jobbazar_mobile/provider/models/job.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';
import 'package:jobbazar_mobile/shared/page_appbar.dart';
import 'package:jobbazar_mobile/shared/theme/employer/employer_gradient.dart';
import 'package:jobbazar_mobile/shared/theme/employer/theme.dart';
import 'package:jobbazar_mobile/shared/util/heading/heading_text.dart';
import 'package:provider/provider.dart';

class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({super.key});

  @override
  State<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  late List<Job> jobs = [];

  fetchData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final jobProvider = Provider.of<JobProvider>(context, listen: false);
    await jobProvider.fetchJobsByEmployer(userId: authProvider.currentUser!.id);
    jobs = jobProvider.employerJobs;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    final applicationProvider = Provider.of<ApplicationProvider>(context);
    return Theme(
      data: employerTheme,
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: const PageAppbar(title: "Applications"),
            bottomNavigationBar: const BottomNav(),
            drawer: const AppDrawer(),
            body: Container(
              decoration: employerDecoration,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  jobs.isEmpty ? const HeadingText(title: "View Applications For Jobs",) : HeadingText(title: "View Applications For Jobs", subtitle: "${jobs.length} Jobs found",),
                  Expanded(
                    child: Center(
                      child: Builder(
                        builder: (context) {
                          if (jobs.isNotEmpty) {
                            return Card(
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text("No.")),
                                  DataColumn(label: Text("Title")),
                                  DataColumn(label: Text("Actions"))
                                ], 
                                rows: jobs.map(
                                  (job) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text("${jobs.indexOf(job) + 1}")
                                      ),
                                      DataCell(
                                        Text(job.title)
                                      ),
                                      DataCell(
                                        ElevatedButton(
                                          // TODO: Implement This
                                          onPressed: () async {
                                            var applications = await applicationProvider.fetchApplicationByJobId(job.id);
                                            debugPrint("Applications: $applications");
                                            Navigator.pushReplacement(
                                              context, 
                                              MaterialPageRoute(builder: (context) => ApplicationsTable(applications: applications))
                                            );
                                          }, 
                                          child: Text("View Application")
                                        )
                                      )
                                    ]
                                  )
                                ).toList()
                              ),
                            );
                          } else {
                            fetchData();
                            return const Center(child: CircularProgressIndicator());
                          }
                        }
                      ),
                    ),
                  )
                ],
              ),
            )
          );
        }
      ),
    );
  }
}