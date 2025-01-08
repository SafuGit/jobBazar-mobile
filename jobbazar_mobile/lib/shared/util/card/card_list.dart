import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/models/job.dart';
import 'package:jobbazar_mobile/shared/util/card/wrapper/card_button_wrapper.dart';

class CardList extends StatefulWidget {
  final List<Job> jobs;
  final ThemeData? theme;
  const CardList({super.key, required this.jobs, this.theme});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  late List<Job> filteredJobs;

  // void _filterJobs(String query) {
  //   setState(() {
  //     filteredJobs = widget.jobs
  //         .where((job) => job.title.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    filteredJobs = List<Job>.from(widget.jobs);
          return Flexible(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 10,
                  // mainAxisSpacing: 10
                  // childAspectRatio: 0.9
                ),
                itemCount: widget.jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  final job = widget.jobs[index];
                  return Card(
                    shadowColor: Colors.black,
                    elevation: 20,
                    child: SingleChildScrollView(
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
                      
                          // Column(
                            // children: [
                              CardButtonWrapper(job: job, theme: widget.theme),
                            // ],
                          // )
                        ],
                      ),
                    ),
                  );
                }
              ),
            );
  }
}