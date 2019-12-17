import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/widgets/weather_chart.dart';
import 'package:all_things_eswatini/model/weather.dart';
import 'package:all_things_eswatini/model/weather_condition.dart';
import 'package:all_things_eswatini/model/weather_forecast.dart';
import 'package:all_things_eswatini/model/chart/chart_data.dart';
import 'package:all_things_eswatini/model/chart/weather_forecast_holder.dart';
import 'package:all_things_eswatini/config/constants.dart';

class StationInfo extends StatelessWidget {

  final Weather station;

  StationInfo({Key key, @required this.station}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    double height = 250.0;
    List<WeatherForecast> forecast = [
      new WeatherForecast(id: 1, condition: WeatherCondition.lightCloud, minTemp: 3.0, maxTemp: 17.5, date: DateTime.now()),
      new WeatherForecast(id: 2, condition: WeatherCondition.lightCloud, minTemp: 8.0, maxTemp: 21.8, date: DateTime.now()),
      new WeatherForecast(id: 3, condition: WeatherCondition.clear, minTemp: 11.0, maxTemp: 33.2, date: DateTime.now()),
      new WeatherForecast(id: 4, condition: WeatherCondition.heavyRain, minTemp: 4.0, maxTemp: 27.0, date: DateTime.now()),
      new WeatherForecast(id: 4, condition: WeatherCondition.heavyRain, minTemp: 4.0, maxTemp: 27.0, date: DateTime.now()),
      new WeatherForecast(id: 4, condition: WeatherCondition.heavyRain, minTemp: 4.0, maxTemp: 27.0, date: DateTime.now()),
    ];

    WeatherForecastHolder forecastHolder = new WeatherForecastHolder(forecast);
    ChartData chartData = forecastHolder.setupChartData(width, height);

    return Center(
        child: Column(
            children: [
              getWeatherIcon(context),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              getMinMaxReadings(context),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              WeatherChart(chartData: chartData),
            ]
        )
    );
  }

  Image getWeatherIcon(BuildContext context) {
    return Image.asset(Constants.iconSun, width: 100, height: 100);
  }

  Widget getTemperature(BuildContext context) {
    String temp = formatTemperature(station.temp);

    return Text(temp, style: Theme.of(context).textTheme.subtitle);
  }

  RichText getMinMaxReadings(BuildContext context){
    String min = formatTemperature(station.minTemp);
    String max = formatTemperature(station.maxTemp);

    return RichText(
        text: TextSpan(
            children: [
              TextSpan(text: 'min  ', style: bodyStyle),
              TextSpan(text: min, style: subtitleStyle),
              TextSpan(text: '   max  ', style: bodyStyle),
              TextSpan(text: max, style: subtitleStyle)
            ]
        )
    );
  }

  String formatTemperature(double temp){
    return '${temp.toString()}°C';
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

  static const TextStyle bodyStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w900,
      fontSize: 14.0
  );

  static const TextStyle subtitleStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  );

}