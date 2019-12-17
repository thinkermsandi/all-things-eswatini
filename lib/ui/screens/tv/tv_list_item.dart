import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

import 'package:all_things_eswatini/ui/screens/tv/tv_list_item_info.dart';
import 'package:all_things_eswatini/ui/screens/tv/tv_list_item_showtime.dart';
import 'package:all_things_eswatini/model/tv_show.dart';

class TvListItem extends StatelessWidget {
  final TvShow show;
  final VoidCallback onTapped;

  TvListItem({
    @required this.show,
    @required this.onTapped
  });

  @override
  Widget build(BuildContext context) {

    final tvCard = new Container(
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
          TvListItemShowtime(show),
          TvListItemInfo(show),
          //watchButton,
        ],
      ),
    );

    final watchButton = IconButton(
      color: Theme.of(context).accentColor,
      icon: const Icon(Icons.play_arrow),
      onPressed: () => {},
    );

    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
      margin: EdgeInsets.only(top: 10.0, left: 2.0, right: 2.0),
      child: Material(
        child: InkWell(
          onTap: onTapped,
          child: Container(
            child: new Stack(
              children: <Widget>[
                tvCard,
              ],
            ),
          ),
        ),
      ),
    );
  }

}