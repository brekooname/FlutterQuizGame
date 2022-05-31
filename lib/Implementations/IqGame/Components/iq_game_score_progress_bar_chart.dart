import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

class IqGameScoreProgressBarChart extends StatelessWidget with LabelMixin {
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();
  static final fontSize = FontConfig.getCustomFontSize(0.7).toInt();
  List<IqGameScoreInfo> scoreInfo;

  IqGameScoreProgressBarChart(this.scoreInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var yAxisStyle =
        buildNumericAxisSpec(charts.MaterialPalette.blue.shadeDefault.darker);
    var xAxisStyle =
        buildDateAxisSpec(charts.MaterialPalette.green.shadeDefault.darker);

    var data =
        scoreInfo.map((e) => LinearSales(e.score, e.timeStamp, 0.0)).toList();
    ChartBehavior<num>? seriesLegend = charts.SeriesLegend(
      position: charts.BehaviorPosition.top,
      entryTextStyle: charts.TextStyleSpec(
          color: charts.MaterialPalette.red.shadeDefault.darker,
          fontSize: fontSize),
    );
    List<Widget> stackChildren = [];
    var lineChart = charts.LineChart(
      _createSampleData(data, true, _screenDimensionsService.dimen(1)),
      animate: true,
      primaryMeasureAxis: yAxisStyle,
      domainAxis: xAxisStyle,
      behaviors: [],
    );
    stackChildren.add(lineChart);
    List<LinearSales> dataWithPlot = data.toList();
    // dataWithPlot
    //     .add(LinearSales(age!, selfEsteem, _screenDimensionsService.dimen(1)));
    var scatterPlotChart = charts.ScatterPlotChart(
        _createSampleData(
            dataWithPlot, false, _screenDimensionsService.dimen(1)),
        primaryMeasureAxis: yAxisStyle,
        domainAxis: xAxisStyle,
        behaviors: [],
        animate: true);
    stackChildren.add(scatterPlotChart);
    return Stack(
      children: stackChildren,
    );
  }

  charts.DateTimeAxisSpec buildDateAxisSpec(charts.Color? fontColor) {
    return charts.DateTimeAxisSpec(
        viewport: charts.DateTimeExtents(
            start: scoreInfo
                .reduce(
                    (a1, a2) => a1.timeStamp.isBefore(a2.timeStamp) ? a1 : a2)
                .timeStamp,
            end: scoreInfo
                .reduce(
                    (a1, a2) => a1.timeStamp.isAfter(a2.timeStamp) ? a1 : a2)
                .timeStamp),
        renderSpec: charts.GridlineRendererSpec(
            labelStyle:
                charts.TextStyleSpec(fontSize: fontSize, color: fontColor),
            lineStyle: charts.LineStyleSpec(
                color: charts.MaterialPalette.gray.shade400)));
  }

  charts.NumericAxisSpec buildNumericAxisSpec(charts.Color? fontColor) {
    return charts.NumericAxisSpec(
        viewport: charts.NumericExtents(0.0,
            scoreInfo.reduce((a1, a2) => a1.score > a2.score ? a1 : a2).score),
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
        domainFn: (LinearSales sales, _) => sales.score,
        measureFn: (LinearSales sales, _) => sales.timeStamp.day,
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        strokeWidthPxFn: (LinearSales sales, _) => strokeWidth,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int score;
  final DateTime timeStamp;
  final double radius;

  LinearSales(this.score, this.timeStamp, this.radius);
}
