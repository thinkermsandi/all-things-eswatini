import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:all_things_eswatini/ui/widgets/introduction.dart';
import 'package:all_things_eswatini/ui/widgets/search_card.dart';
import 'package:all_things_eswatini/ui/screens/home/home_menu_grid.dart';

class HomePage extends StatelessWidget {
  Size deviceSize;

  Widget actionMenuCard() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Card(
      elevation: 2.0,
      margin: EdgeInsets.all(0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              HomeMenuGrid()
            ],
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    DateTime now = DateTime.now();

    String greetingsTitle = "";
    IconData greetingsWeatherIcon = FontAwesomeIcons.cloudSun;
    if(now.hour >= 0 && now.hour <= 4){
      greetingsTitle = "Good night";
      greetingsWeatherIcon = FontAwesomeIcons.solidMoon;
    }
    else if(now.hour >= 5 && now.hour <= 11){
      greetingsTitle = "Good morning";
      greetingsWeatherIcon = FontAwesomeIcons.cloudSun;
    }
    else if(now.hour >= 12 && now.hour <= 13){
      greetingsTitle = "Good day";
      greetingsWeatherIcon = FontAwesomeIcons.sun;
    }
    else if(now.hour >= 14 && now.hour <= 17){
      greetingsTitle = "Good afternoon";
      greetingsWeatherIcon = FontAwesomeIcons.cloudSun;
    }
    else if(now.hour >= 18 && now.hour <= 19){
      greetingsTitle = "Good evening";
      greetingsWeatherIcon = FontAwesomeIcons.cloudSun;
    }
    else if(now.hour >= 20 && now.hour <= 23){
      greetingsTitle = "Good night";
      greetingsWeatherIcon = FontAwesomeIcons.moon;
    }

    String dateString = new DateFormat("EEEE, MMM d yyyy").format(new DateTime.now());
    String timeString = new DateFormat("HH:mm").format(new DateTime.now());

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.grey[100],
            Colors.grey[200],
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 12.0,),
              Introduction(title: timeString, primaryText: dateString, secondaryText: "Hi 18C Lo 6C", icon: greetingsWeatherIcon, iconColor: Colors.orange,),
              SizedBox(height: 6.0,),
              SearchCard(placeholder: "Explore",),
              SizedBox(height: 16.0,),
              actionMenuCard(),
              SizedBox(height: 16.0,),
            ],
          )
        ),
      ),
    );
  }
}