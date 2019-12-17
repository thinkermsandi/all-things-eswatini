import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

import 'package:all_things_eswatini/ui/screens/jobs/job_list_item_thumbnail.dart';
import 'package:all_things_eswatini/model/job.dart';

class JobsListItem extends StatelessWidget {
  final Job job;
  final VoidCallback onTapped;

  JobsListItem({
    @required this.job,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    String tag = randomString(5);

    final jobCard = new Container(
      padding: EdgeInsets.all(12.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.0),
        boxShadow: [
          BoxShadow(blurRadius: 2, spreadRadius: 1, color: Colors.black.withOpacity(0.1),),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(shape: BoxShape.rectangle,),
            child: Center(
              child: JobListItemThumbnail(tag, job.employer.photo),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(job.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle),
              new Text(job.employer.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: infoDetailsStyle),
              new Container(
                  color: const Color(0xFF00C6FF),
                  width: 24.0,
                  height: 1.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0)
              ),
              new Row(
                children: <Widget>[
                  new Icon(Icons.location_on, size: 14.0, color: const Color(0xff7a7a7a)),
                  new Text(job.location, style: infoExtraDetailsStyle),
                  new Container(width: 24.0),
                  new Icon(Icons.calendar_today, size: 14.0, color: const Color(0xff7a7a7a)),
                  new Text(new DateFormat.yMMMd().format(job.expires), style: infoExtraDetailsStyle),
                ],
              )
            ],
          ),
        ],
      ),
    );

    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
      margin: EdgeInsets.only(top: 12.0),
      child: Material(
        child: InkWell(
          onTap: onTapped,
          child: Container(
            child: new Stack(
              children: <Widget>[
                jobCard
              ],
            ),
          ),
        ),
      ),
    );

  }

  static const TextStyle titleStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 18.0
  );

  static const TextStyle infoDetailsStyle = const TextStyle(
      color: const Color(0xff7a7a7a),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  );

  static const TextStyle infoExtraDetailsStyle = const TextStyle(
      color: const Color(0xff7a7a7a),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );

}