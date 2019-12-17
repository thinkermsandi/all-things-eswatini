import 'package:all_things_eswatini/model/chart/chart_data.dart';
import 'package:all_things_eswatini/model/weather.dart';
import 'package:all_things_eswatini/model/weather_forecast.dart';
import 'package:all_things_eswatini/model/weather_condition.dart';

class WeatherForecastHolder {
  List<double> _temperatures;
  double _averageTemperature;
  double _maxTemperature;
  double _minTemperature;

  String _dateShortFormatted;
  String _weatherCodeAsset;
  List<WeatherForecast> _forecastList;

  WeatherForecastHolder(List<WeatherForecast> forecastList) {
    _forecastList = forecastList;
    _temperatures = _getTemperaturesList();

    _averageTemperature = _calculateAverage(_temperatures);
    _maxTemperature = _calculateMax(_temperatures);
    _minTemperature = _calculateMin(_temperatures);

    //setupDateFormatted(forecastList[0].date);
    setupDateFormatted(DateTime.now());
    setupWeatherCode(forecastList);
  }

  List<double> _getTemperaturesList() {
    List<double> temperatures = new List();

    for (WeatherForecast response in forecastList) {
      temperatures.add(response.maxTemp);
    }

    return temperatures;
  }

  void setupDateFormatted(DateTime dateTime) {
    int day = dateTime.day;
    String dayString = "";
    if (day < 10) {
      dayString = "0" + day.toString();
    } else {
      dayString = day.toString();
    }

    int month = dateTime.month;
    String monthString = "";
    if (month < 10) {
      monthString = "0" + month.toString();
    } else {
      monthString = month.toString();
    }

    _dateShortFormatted = dayString + "/" + monthString;
  }

  double _calculateAverage(List<double> values) {
    double sum = 0;
    for (var value in values) {
      sum += value;
    }

    return sum / values.length;
  }

  double _calculateMax(List<double> values) {
    double maxValue = 0.0;

    if(values.length > 0){
      maxValue = values[0];

      for (var value in values) {
        if (value >= maxValue) {
          maxValue = value;
        }
      }
    }

    return maxValue;
  }

  double _calculateMin(List<double> values) {
    double minValue = 0.0;

    if(values.length > 0){
      minValue = values[0];

      for (var value in values) {
        if (value <= minValue) {
          minValue = value;
        }
      }
    }

    return minValue;
  }

  void setupWeatherCode(List<WeatherForecast> forecastList) {
    WeatherCondition condition = WeatherCondition.unknown;

    if(forecastList.length > 0){
      int index = (forecastList.length / 2).floor();
      condition = forecastList[index].condition;
    }

    _weatherCodeAsset = Weather.mapWeatherConditionToWeatherAsset(condition);
  }

  ChartData setupChartData(double width, double height) {
    return ChartData(this, width, height);
  }

  String get weatherCodeAsset => _weatherCodeAsset;

  double get averageTemperature => _averageTemperature;

  double get minTemperature => _minTemperature;

  double get maxTemperature => _maxTemperature;

  String get dateShortFormatted => _dateShortFormatted;

  List<WeatherForecast> get forecastList => _forecastList;

  List<double> get temperatures => _temperatures;
}