import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/jobs/job/job_header.dart';
import 'package:all_things_eswatini/ui/screens/jobs/job/job_detail.dart';
import 'package:all_things_eswatini/model/job.dart';

class JobPage extends StatelessWidget {
  final Job job;

  JobPage({Key key, @required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: Column(
              children: <Widget>[
                JobHeader(job: job),
                JobDetail(job: job),
              ],
            ),
          ),
        ),
      ),
    );

  }

}