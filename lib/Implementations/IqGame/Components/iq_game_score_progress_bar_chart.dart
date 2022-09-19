import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:charts_flutter_new/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

class IqGameScoreProgressBarChart extends StatelessWidget with LabelMixin {
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();
  static final fontSize = FontConfig.getCustomFontSize(1).toInt();
  List<IqGameScoreInfo> scoreInfo;
  int maxScore;

  IqGameScoreProgressBarChart(this.scoreInfo, this.maxScore, {Key? key})
      : super(key: key);

  List<charts.TickSpec<int>> getTickSpec(int min, int max) {
    List<charts.TickSpec<int>> res = [];
    if (max - min < 6) {
      for (int i = min; i <= max; i++) {
        res.add(charts.TickSpec(i));
      }
    } else {
      res.add(charts.TickSpec(min));
      res.add(charts.TickSpec((max / 4).ceil()));
      res.add(charts.TickSpec((max / 2).ceil()));
      res.add(charts.TickSpec((max / 1.33).ceil()));
      res.add(charts.TickSpec(max));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var yAxisStyle = buildNumericAxisSpec(
        charts.MaterialPalette.blue.shadeDefault.darker,
        getTickSpec(0, maxScore));
    var xAxisStyle = buildNumericAxisSpec(
        charts.MaterialPalette.green.shadeDefault.darker,
        getTickSpec(1, scoreInfo.length));

    var data = scoreInfo
        .map((e) => LinearSales(e.score, scoreInfo.indexOf(e) + 1, 0.0))
        .toList();
    List<Widget> stackChildren = [];
    var lineChart = charts.LineChart(
      _createSampleData(data, true, _screenDimensionsService.dimen(1)),
      animate: true,
      primaryMeasureAxis: yAxisStyle,
      domainAxis: xAxisStyle,
    );
    stackChildren.add(lineChart);
    List<LinearSales> dataWithPlot = data.toList();
    dataWithPlot.add(LinearSales(scoreInfo.last.score, scoreInfo.length,
        _screenDimensionsService.dimen(1)));
    var scatterPlotChart = charts.ScatterPlotChart(
        _createSampleData(
            dataWithPlot, false, _screenDimensionsService.dimen(3)),
        primaryMeasureAxis: yAxisStyle,
        domainAxis: xAxisStyle,
        animate: true);
    stackChildren.add(scatterPlotChart);
    return Stack(
      children: stackChildren,
    );
  }

  charts.NumericAxisSpec buildNumericAxisSpec(
      charts.Color? fontColor, List<charts.TickSpec<int>> staticTicks) {
    return charts.NumericAxisSpec(
        tickProviderSpec: charts.StaticNumericTickProviderSpec(staticTicks),
        showAxisLine: true,
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
        domainFn: (LinearSales sales, _) => sales.gameNr,
        measureFn: (LinearSales sales, _) => sales.score,
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        strokeWidthPxFn: (LinearSales sales, _) => strokeWidth,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int score;
  final int gameNr;
  final double radius;

  LinearSales(this.score, this.gameNr, this.radius);
}
