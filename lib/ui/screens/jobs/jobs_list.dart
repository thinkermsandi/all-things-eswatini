import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/jobs/jobs_list_item.dart';
import 'package:all_things_eswatini/ui/screens/jobs/job/job_page.dart';
import 'package:all_things_eswatini/model/loading_status.dart';
import 'package:all_things_eswatini/model/job.dart';
import 'package:all_things_eswatini/redux/state.dart';
import 'package:all_things_eswatini/util/navigation_utils.dart';

class JobsList extends StatelessWidget {

  JobsList({Key key}) : super(key: key);

  void _viewJob(BuildContext context, Job job) {
    materialNavigateTo(context, JobPage(job: job));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        List<Job> jobs = vm.jobs;

        if (jobs.length == 0) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
            child: Center(child: Text('No jobs available...', style: Theme.of(context).textTheme.subtitle,)),
          );
        }

        return Container(
          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
          child: new ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: jobs.length,
            itemBuilder: (context, i) => new JobsListItem(job: jobs[i], onTapped: () => _viewJob(context, jobs[i]),),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final LoadingStatus status;
  final List<Job> jobs;

  _ViewModel({
    this.status,
    this.jobs,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      status: store.state.jobsStatus,
      jobs: store.state.jobs,
    );
  }
}