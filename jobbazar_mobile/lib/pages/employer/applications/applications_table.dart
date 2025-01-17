import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/models/application.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';
import 'package:jobbazar_mobile/shared/page_appbar.dart';
import 'package:jobbazar_mobile/shared/theme/employer/employer_gradient.dart';
import 'package:jobbazar_mobile/shared/theme/employer/theme.dart';
import 'package:jobbazar_mobile/shared/util/heading/heading_text.dart';

class ApplicationsTable extends StatefulWidget {
  final List<Application> applications;
  const ApplicationsTable({super.key, required this.applications});

  @override
  State<ApplicationsTable> createState() => _ApplicationsTableState();
}

class _ApplicationsTableState extends State<ApplicationsTable> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: employerTheme,
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: const PageAppbar(title: "Application"),
            bottomNavigationBar: const BottomNav(),
            drawer: const AppDrawer(),
            body: widget.applications.isNotEmpty ? Container(
              decoration: employerDecoration,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  HeadingText(title: "View Applications For Jobs", subtitle: "${widget.applications.length} Applications found",),
                  Card(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text("Applicant")),
                        DataColumn(label: Text("Status")),
                        DataColumn(label: Text("Actions"))
                      ], 
                      rows: widget.applications.map(
                        (application) => DataRow(
                          cells: [
                            DataCell(Text(application.applicant_name)),
                            DataCell(Text(application.status)),
                            DataCell(
                              DropdownButton<String>(
                                hint: const Text("Actions"),
                                items: [
                                  DropdownMenuItem(
                                    value: "viewCV",
                                    child: TextButton(
                                      onPressed: () {

                                      },
                                      child: const Text("View CV", style: TextStyle(color: Colors.blue),),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: "accept",
                                    child: TextButton(
                                      onPressed: () {

                                      },
                                      child: const Text("ACCEPT"),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: "reject",
                                    child: TextButton(
                                      onPressed: () {

                                      },
                                      child: const Text("REJECT", style: TextStyle(color: Colors.red),),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value == "viewCV") {

                                  } else if (value == "accept") {

                                  } else if (value == "reject") {

                                  }
                                },
                              ),

                            ),
                          ]
                        )
                      ).toList()
                    ),
                  ),
                ],
              ),
            ) : Container(
              decoration: employerDecoration,
              width: double.infinity,
              height: double.infinity,
              child: const Center(
                child: HeadingText(title: "No Applications Found"),
              ),
            )
          );
        }
      ),
    );
  }
}