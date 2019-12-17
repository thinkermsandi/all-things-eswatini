import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final String placeholder;
  final String query;
  final onSearch;

  SearchCard({this.placeholder, this.query, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(0.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.search),
              SizedBox(width: 10.0,),
              Expanded(
                child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: placeholder),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}