import 'dart:math';
import 'dart:ui';

import 'package:all_things_eswatini/model/chart/point.dart';
import 'package:all_things_eswatini/model/chart/chart_line.dart';
import 'package:all_things_eswatini/model/chart/weather_forecast_holder.dart';
import 'package:all_things_eswatini/util/utils.dart';

class ChartData {
  List<Point> _points;
  List<String> _pointLabels;
  double _width;
  double _height;
  List<ChartLine> _axes;

  ChartData(WeatherForecastHolder holder, double width, double height) {
    setupChartData(holder, width, height);
  }

  void setupChartData(WeatherForecastHolder holder, double width, double height) {
    List<double> values = _getChartValues(holder);
    double averageValue = _getChartAverageValue(holder);
    this._points = _getPoints(values, averageValue, width, height);
    this._pointLabels = _getPointLabels(values);
    String mainAxisText = _getMainAxisText(averageValue);
    this._axes = _getAxes(_points, height, width, mainAxisText);
    this._width = width;
    this._height = height;
  }

  List<double> _getChartValues(WeatherForecastHolder holder) {
    //Checked
    List<double> dataSet = holder.temperatures;

    return dataSet;
  }

  double _getChartAverageValue(WeatherForecastHolder holder) {
    //Checked
    double averageValue = holder.averageTemperature;

    return averageValue;
  }

  List<Point> _getPoints(List<double> values, double averageValue, double width, double height) {
    //Checked
    List<Point> points = List();
    double halfHeight = (height - 15) / 2;
    double widthStep = width / (values.length - 1);
    double currentX = 0;

    List<double> averageDifferenceValues = _getAverageDifferenceValues(values, averageValue);
    double maxValue = _getAbsoluteMax(averageDifferenceValues);

    for (double averageDifferenceValue in averageDifferenceValues) {
      var y = halfHeight - (halfHeight * averageDifferenceValue / maxValue);
      if (y.isNaN) {
        y = halfHeight;
      }
      points.add(Point(currentX, y));
      currentX += widthStep;
    }

    return points;
  }

  List<double> _getAverageDifferenceValues(List<double> values, double averageValue) {
    //Checked
    List<double> calculatedValues = new List();
    for (double value in values) {
      calculatedValues.add(value - averageValue);
    }

    return calculatedValues;
  }

  double _getAbsoluteMax(List<double> values) {
    //Checked
    double maxValue = 0;
    for (double value in values) {
      maxValue = max(maxValue, value.abs());
    }

    return maxValue;
  }

  List<String> _getPointLabels(List<double> values) {
    //Checked
    List<String> points = List();
    for (double value in values) {
      points.add(value.toString());
    }

    return points;
  }

  List<ChartLine> _getAxes(List<Point> points, double height, double width, String mainAxisText) {
    List<ChartLine> list = new List();
    list.add(ChartLine(mainAxisText, Offset(-25, height / 2 - 15), Offset(-5, (height - 15) / 2), Offset(width + 5, (height - 15) / 2)));

    for (int index = 0; index < points.length; index++) {
      Point point = points[index];
      String day = "Mon"; //TODO: Dynamically add day
      list.add(ChartLine(day, Offset(point.x - 10, height - 10), Offset(point.x, 0), Offset(point.x, height - 10)));
    }

    return list;
  }

  String _getMainAxisText(double averageValue) {
    var temperature = averageValue;
    String text = Utils.formatTemperature(temperature: temperature, positions: 1, round: false);

    return text;
  }

  List<ChartLine> get axes => _axes;

  double get height => _height;

  double get width => _width;

  List<String> get pointLabels => _pointLabels;

  List<Point> get points => _points;

}