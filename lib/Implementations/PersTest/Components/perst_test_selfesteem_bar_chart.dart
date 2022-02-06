import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

class PersTestSelfEsteemBarChart extends StatelessWidget {
  final ScreenDimensionsService _screenDimensionsService =
      ScreenDimensionsService();
  static final fontSize = FontConfig.getCustomFontSize(0.7).toInt();

  @override
  Widget build(BuildContext context) {
    var yAxisStyle =
        buildNumericAxisSpec(charts.MaterialPalette.blue.shadeDefault.darker);
    var xAxisStyle =
        buildNumericAxisSpec(charts.MaterialPalette.green.shadeDefault.darker);
    var selfEsteemData = [
      LinearSales(0, 0, 0.0),
      LinearSales(10, 15, 0.0),
      LinearSales(20, 45, 0.0),
      LinearSales(30, 65, 0.0),
      LinearSales(40, 80, 0.0),
      LinearSales(50, 85, 0.0),
      LinearSales(60, 85, 0.0),
      LinearSales(70, 80, 0.0),
      LinearSales(80, 70, 0.0),
      LinearSales(85, 65, 0.0),
      LinearSales(90, 50, 0.0),
      LinearSales(100, 30, 0.0),
    ];
    var lineChart = charts.LineChart(
      _createSampleData(
          selfEsteemData, true, _screenDimensionsService.dimen(1)),
      animate: true,
      primaryMeasureAxis: yAxisStyle,
      domainAxis: xAxisStyle,
      behaviors: [
        charts.PanAndZoomBehavior(),
        charts.LinePointHighlighter(
            showHorizontalFollowLine:
                charts.LinePointHighlighterFollowLineType.none,
            showVerticalFollowLine:
                charts.LinePointHighlighterFollowLineType.nearest),
        charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag)
      ],
    );
    List<LinearSales> dataWithPlot = selfEsteemData.toList();
    dataWithPlot.add(LinearSales(34, 15, _screenDimensionsService.dimen(1)));
    var scatterPlotChart = charts.ScatterPlotChart(
        _createSampleData(
            dataWithPlot, false, _screenDimensionsService.dimen(1)),
        primaryMeasureAxis: yAxisStyle,
        domainAxis: xAxisStyle,
        animate: true);
    return Stack(
      children: [lineChart, scatterPlotChart],
    );
  }

  charts.NumericAxisSpec buildNumericAxisSpec(charts.Color? fontColor) {
    return charts.NumericAxisSpec(
        viewport: const charts.NumericExtents(0.0, 100.0),
        renderSpec: charts.GridlineRendererSpec(
            labelStyle:
                charts.TextStyleSpec(fontSize: fontSize, color: fontColor),
            lineStyle: charts.LineStyleSpec(
                color: charts.MaterialPalette.gray.shade400)));
  }

  static List<charts.Series<LinearSales, int>> _createSampleData(
      List<LinearSales> data, bool blueColor, double strokeWidth) {
    return [
      charts.Series<LinearSales, int>(
        id: 'se',
        colorFn: (LinearSales sales, _) => blueColor
            ? charts.MaterialPalette.blue.shadeDefault
            : charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        strokeWidthPxFn: (LinearSales sales, _) => strokeWidth,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final double radius;

  LinearSales(this.year, this.sales, this.radius);
}
