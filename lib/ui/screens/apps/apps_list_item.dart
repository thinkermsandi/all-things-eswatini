import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';

import 'package:all_things_eswatini/ui/screens/apps/app_list_item_thumbnail.dart';
import 'package:all_things_eswatini/model/mobile_app.dart';

class AppsListItem extends StatelessWidget {
  final MobileApp app;
  final VoidCallback onTapped;

  AppsListItem({
    @required this.app,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    String tag = randomString(5);

    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            child: InkWell(
              child: AppListItemThumbnail(tag, app.photo),
              onTap: onTapped,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(app.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: infoExtraDetailsStyle,),
                          SizedBox(height: 3.0),
                          Text(app.size.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: infoExtraDetailsStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Icon(Icons.more_vert, size: 16.0,),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
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
      color: Colors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );

}