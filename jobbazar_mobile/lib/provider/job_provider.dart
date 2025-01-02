
import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/models/job.dart';
import 'package:jobbazar_mobile/provider/services/job_service.dart';

class JobProvider with ChangeNotifier {
  final JobService _jobService = JobService();
  List<Job> _jobs = [];

  List<Job> get jobs => _jobs;

  Future<void> fetchJobs() async {
    try {
      _jobs = await _jobService.getJobs();
    } catch (e) {
      _jobs = [];
      debugPrint('Error: $e');
    } finally {
      notifyListeners();
    }
  }

}