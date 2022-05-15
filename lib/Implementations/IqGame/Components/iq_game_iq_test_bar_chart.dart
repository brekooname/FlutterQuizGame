import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

class IqGameIqTestBarChart extends StatelessWidget with LabelMixin {
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();
  static final fontSize = FontConfig.getCustomFontSize(0.7).toInt();
  int selfEsteem;
  int? age;

  IqGameIqTestBarChart(this.selfEsteem, this.age);

  @override
  Widget build(BuildContext context) {
    var yAxisStyle =
        buildYAxisSpec(charts.MaterialPalette.blue.shadeDefault.darker);
    var xAxisStyle =
        buildXAxisSpec(charts.MaterialPalette.green.shadeDefault.darker);
    List<LinearSales> selfEsteemData = [];
    int startIq = 5;
    int calcIq = startIq;
    for (int i = 60; i <= 140; i++) {
      int diff = (40 - 100 - i).abs();
      debugPrint(diff.toString());
      if (i > 100) {
        calcIq = calcIq - diff;
      } else {
        calcIq = calcIq + diff;
      }
      selfEsteemData.add(LinearSales(i, (calcIq / 100).toInt(), 0.0));
    }
    ChartBehavior<num>? seriesLegend = charts.SeriesLegend(
      position: charts.BehaviorPosition.top,
      entryTextStyle: charts.TextStyleSpec(
          color: charts.MaterialPalette.red.shadeDefault.darker,
          fontSize: fontSize),
    );
    List<Widget> stackChildren = [];
    var lineChart = charts.LineChart(
      _createSampleData(
          selfEsteemData, true, _screenDimensionsService.dimen(1)),
      animate: true,
      primaryMeasureAxis: yAxisStyle,
      domainAxis: xAxisStyle,
      behaviors: [
        seriesLegend,
      ],
    );
    stackChildren.add(lineChart);
    var ageSubmitted = age != null && age != -1;
    if (ageSubmitted) {
      List<LinearSales> dataWithPlot = selfEsteemData.toList();
      dataWithPlot.add(
          LinearSales(age!, selfEsteem, _screenDimensionsService.dimen(1)));
      var scatterPlotChart = charts.ScatterPlotChart(
          _createSampleData(
              dataWithPlot, false, _screenDimensionsService.dimen(1)),
          primaryMeasureAxis: yAxisStyle,
          domainAxis: xAxisStyle,
          behaviors: [seriesLegend],
          animate: true);
      stackChildren.add(scatterPlotChart);
    }
    return Stack(
      children: stackChildren,
    );
  }

  charts.NumericAxisSpec buildXAxisSpec(charts.Color? fontColor) {
    return charts.NumericAxisSpec(
        viewport: const charts.NumericExtents(60.0, 140.0),
        renderSpec: charts.GridlineRendererSpec(
            labelStyle:
                charts.TextStyleSpec(fontSize: fontSize, color: fontColor),
            lineStyle: charts.LineStyleSpec(
                color: charts.MaterialPalette.gray.shade400)));
  }

  charts.NumericAxisSpec buildYAxisSpec(charts.Color? fontColor) {
    return charts.NumericAxisSpec(
        viewport: const charts.NumericExtents(0.0, 100.0),
        renderSpec: charts.GridlineRendererSpec(
            labelStyle:
                charts.TextStyleSpec(fontSize: fontSize, color: fontColor),
            lineStyle: charts.LineStyleSpec(
                color: charts.MaterialPalette.gray.shade400)));
  }

  List<charts.Series<LinearSales, int>> _createSampleData(
      List<LinearSales> data, bool blueColor, double strokeWidth) {
    return [
      charts.Series<LinearSales, int>(
        id: label.l_self_esteem,
        colorFn: (LinearSales sales, _) => blueColor
            ? charts.MaterialPalette.blue.shadeDefault
            : charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.age,
        measureFn: (LinearSales sales, _) => sales.selfEsteem,
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        strokeWidthPxFn: (LinearSales sales, _) => strokeWidth,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int age;
  final int selfEsteem;
  final double radius;

  LinearSales(this.age, this.selfEsteem, this.radius);
}
