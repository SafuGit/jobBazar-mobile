import 'package:common_constants/common_constants.dart';
import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/application_provider.dart';
import 'package:jobbazar_mobile/provider/cv_provider.dart';
import 'package:jobbazar_mobile/provider/job_provider.dart';
import 'package:jobbazar_mobile/shared/pages/args/job_args.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/provider/models/job.dart';
import 'package:jobbazar_mobile/shared/theme/employer/theme.dart';
import 'package:provider/provider.dart';

class CardButtonWrapper extends StatefulWidget {
  final Job job;
  final ThemeData? theme;
  const CardButtonWrapper({super.key, required this.job, this.theme});

  @override
  State<CardButtonWrapper> createState() => _CardButtonWrapperState();
}

class _CardButtonWrapperState extends State<CardButtonWrapper> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final cvProvider = Provider.of<CvProvider>(context);
    final appProvider = Provider.of<ApplicationProvider>(context);
    final jobProvider = Provider.of<JobProvider>(context);


    if (authProvider.userType == "USER") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/jobInfo', arguments: JobArgs(title: widget.job.title, description: widget.job.description, location: widget.job.location, salary: widget.job.salary, company: widget.job.company, jobType: widget.job.type,));
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)
              ), 
              child: const Text("Get Info", style: TextStyle(color: Colors.black),)
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await cvProvider.fetchCv(authProvider.currentUser!.id).whenComplete(() async {
                try {
                  final Map<String, dynamic> appData = {
                    "jobId": widget.job.id,
                    "userId": authProvider.currentUser!.id,
                    "status": "PENDING",
                    "coverLetter": {
                        "id": cvProvider.currentUserCv.id,
                        "user_id": authProvider.currentUser!.id
                    }
                  };
                  await appProvider.applyForJob(appData: appData, context: context);
                } catch (e) {
                  debugPrint(e.toString());
                  Constants.showSnackbar(context, "ERROR Occured During Job Posting, Have u typed all fields correctly?");
                } finally {
                  Navigator.pushReplacementNamed(context, '/employee/appliedJobs');
                }
              });
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color.fromARGB(223, 233, 164, 60))
            ), 
            child: const Text("Apply", style: TextStyle(color: Colors.black),)
          ),
        ],
      );
    }
    else if (authProvider.userType == "EMPLOYER") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/jobInfo', arguments: JobArgs(title: widget.job.title, description: widget.job.description, location: widget.job.location, salary: widget.job.salary, company: widget.job.company, jobType: widget.job.type, theme: employerTheme));
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)
              ), 
              child: const Text("Get Info", style: TextStyle(color: Colors.black),)
            ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color.fromARGB(223, 233, 164, 60))
              ), 
              child: const Text("Update", style: TextStyle(color: Colors.black),)
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                jobProvider.deleteJob(widget.job.id);
                Navigator.pushReplacementNamed(context, '/employerHome');
              });
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color.fromARGB(220, 173, 34, 24))
            ), 
            child: const Text("Delete", style: TextStyle(color: Colors.black),)
          ),
        ],
      );
    }
    return const Placeholder();
  }
}