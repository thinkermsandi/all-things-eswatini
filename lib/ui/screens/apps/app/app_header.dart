import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/apps/app/app_thumbnail.dart';
import 'package:all_things_eswatini/model/mobile_app.dart';

class AppHeader extends StatelessWidget {
  final MobileApp app;

  AppHeader({Key key, @required this.app}) : super(key: key);

  _downloadApp(BuildContext context, MobileApp app){
    //TODO: File Downloader
  }

  @override
  Widget build(BuildContext context) {
    final thumbnail = Container(
      height: 100,
      width:  100,
      margin: EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: AppThumbnail(url: app.photo,),
      ),
    );

    final content = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(app.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: titleStyle,),
          Text(app.developer.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: infoDetailsStyle,),
          ActionChip(
              label: Text("Download"),
              onPressed: () => _downloadApp(context, app),
          ),
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          thumbnail,
          content,
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
      color: const Color(0xff7a7a7a),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );

}