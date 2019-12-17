import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:all_things_eswatini/model/chart/chart_data.dart';
import 'package:all_things_eswatini/model/chart/chart_line.dart';
import 'package:all_things_eswatini/model/chart/point.dart';
import 'package:all_things_eswatini/ui/widgets/animated_state.dart';

class WeatherChart extends StatefulWidget {
  final ChartData chartData;

  const WeatherChart({Key key, this.chartData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherChartState();
}

class _WeatherChartState extends AnimatedState<WeatherChart>{
  double _fraction = 0.0;

  @override
  void initState() {
    super.initState();
    animateTween(duration: 1000, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {

    Widget chartWidget;
    if (widget.chartData.points.length < 3) {
      chartWidget = _getChartUnavailableWidget(context);
    }
    else {
      chartWidget = _getChartWidget();
    }

    return Container(
      width: widget.chartData.width,
      height: widget.chartData.height,
      child: chartWidget,
    );
  }

  Widget _getChartWidget() {
    return CustomPaint(
      painter: _ChartPainter(
          widget.chartData.points,
          widget.chartData.pointLabels,
          widget.chartData.width,
          widget.chartData.height,
          widget.chartData.axes,
          _fraction),
    );
  }

  Widget _getChartUnavailableWidget(BuildContext context) {
    return Center(child: Text("Chart is unavailable", style: infoDetailsStyle));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onAnimatedValue(double value) {
    setState(() {
      _fraction = value;
    });
  }

  static const TextStyle titleStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 18.0
  );

  static const TextStyle infoDetailsStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  );

  static const TextStyle infoExtraDetailsStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );
}

class _ChartPainter extends CustomPainter {
  _ChartPainter(this.points, this.pointLabels, this.width, this.height, this.axes, this.fraction);

  final List<Point> points;
  final List<String> pointLabels;
  final double width;
  final double height;
  final List<ChartLine> axes;
  final double fraction;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = _getLinePaint(Colors.white);
    _drawAxes(canvas);

    double fractionLinePerPoint = 1/points.length;
    int pointsFraction = (points.length * fraction).ceil();
    double lastLineFraction = fraction - (pointsFraction - 1) * fractionLinePerPoint;
    double lastLineFractionPercentage = lastLineFraction / (1/points.length);

    for (int index = 0;index<pointsFraction-1;index++){
      Offset textOffset = Offset(points[index].x - 5, points[index].y - 15);
      if (index == pointsFraction - 2){
        Point startPoint = points[index];
        Point endPoint = points[index + 1];
        Offset startOffset = _getOffsetFromPoint(startPoint);

        double diffX = endPoint.x - startPoint.x;
        double diffY = endPoint.y - startPoint.y;

        Offset endOffset = Offset(startPoint.x + diffX * lastLineFractionPercentage, startPoint.y + diffY * lastLineFractionPercentage);
        canvas.drawLine(startOffset, endOffset, paint);
        _drawText(canvas, textOffset, pointLabels[index+1], lastLineFractionPercentage, true);

      }
      else {
        canvas.drawLine(_getOffsetFromPoint(points[index]), _getOffsetFromPoint(points[index + 1]), paint);
        _drawText(canvas, textOffset, pointLabels[index], 1, true);
      }
    }

    if (fraction > 0.999) {
      Offset textOffset = Offset(points[points.length - 1].x - 5, points[points.length - 1].y - 15);
      _drawText(canvas, textOffset, pointLabels[points.length - 1], 1, true);
    }

  }

  void _drawText(Canvas canvas, Offset offset, String text, double alphaFraction, bool textShadow) {
    TextStyle textStyle = _getTextStyle(alphaFraction, textShadow);
    TextSpan textSpan = TextSpan(style: textStyle, text: text);
    TextPainter textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout();
    textPainter.paint(canvas, offset);
  }

  TextStyle _getTextStyle(double alphaFraction, bool textShadow) {
    Color color = Color.fromARGB((220 * alphaFraction).floor(), 255, 255, 255);

    if (textShadow) {
      return new TextStyle(
          color: color,
          fontSize: 10,
          letterSpacing: 0,
          shadows: [
            Shadow(offset: Offset(-1.0, -1.0), color: Colors.black),
            Shadow(offset: Offset(1.0, -1.0), color: Colors.black),
            Shadow(offset: Offset(1.0, 1.0), color: Colors.black),
            Shadow(offset: Offset(-1.0, 1.0), color: Colors.black),
          ]);
    }
    else {
      return new TextStyle(color: color, fontSize: 10, letterSpacing: 0);
    }

  }

  @override
  bool shouldRepaint(_ChartPainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }

  Offset _getOffsetFromPoint(Point point) {
    return Offset(point.x, point.y);
  }

  void _drawAxes(Canvas canvas) {
    Paint axesPaint = _getLinePaint(Colors.white30);

    if (axes != null) {
      for (ChartLine lineAxis in axes) {
        canvas.drawLine(lineAxis.lineStartOffset, lineAxis.lineEndOffset, axesPaint);
        _drawText(canvas, lineAxis.textOffset, lineAxis.label, 1, false);
      }
    }

  }

  Paint _getLinePaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    paint..strokeWidth = 1;
    paint..style = PaintingStyle.stroke;
    return paint;
  }

}