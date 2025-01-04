import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/models/job.dart';
import 'package:jobbazar_mobile/shared/util/card/card_button_wrapper.dart';

class CardList extends StatelessWidget {
  final List<Job> jobs;
  final ThemeData? theme;
  const CardList({super.key, required this.jobs, this.theme});

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
                            CardButtonWrapper(job: job, theme: theme),
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