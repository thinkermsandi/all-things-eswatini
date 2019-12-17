import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/jobs/job/job_employer_thumbnail.dart';
import 'package:all_things_eswatini/ui/widgets/app_bar_white.dart';
import 'package:all_things_eswatini/model/job.dart';

class JobHeader extends StatelessWidget {
  final Job job;

  JobHeader({Key key, @required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(job.name, style: titleStyle,),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: JobEmployerThumbnail(url: job.employer.photo,),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(job.employer.name, style: infoDetailsStyle,)
                )
            ),
          ],
        ),
      ],
    );

    return Stack(
      children: <Widget>[
        ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.3,
            minWidth: MediaQuery.of(context).size.width,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
            child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0, bottom: 12.0),
                child: Column(
                  children: <Widget>[
                    AppBarWhite(leftIcon: Icons.arrow_back,),
                    SizedBox(height: 50.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        topContentText,
                      ],
                    ),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }

  static const TextStyle titleStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 28.0
  );

  static const TextStyle infoDetailsStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  );

  static const TextStyle infoExtraDetailsStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );

}