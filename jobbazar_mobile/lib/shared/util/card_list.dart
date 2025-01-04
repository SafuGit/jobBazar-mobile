import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/pages/employee/home/job_args.dart';
import 'package:jobbazar_mobile/provider/models/job.dart';

class CardList extends StatelessWidget {
  final List<Job> jobs;
  const CardList({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
          return Expanded(
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
            );
  }
}