import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'chart_page_widget.dart' show ChartPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChartPageModel extends FlutterFlowModel<ChartPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> chartData = [];
  void addToChartData(dynamic item) => chartData.add(item);
  void removeFromChartData(dynamic item) => chartData.remove(item);
  void removeAtIndexFromChartData(int index) => chartData.removeAt(index);
  void insertAtIndexInChartData(int index, dynamic item) =>
      chartData.insert(index, item);
  void updateChartDataAtIndex(int index, Function(dynamic) updateFn) =>
      chartData[index] = updateFn(chartData[index]);

  String currentInterval = '1m';

  bool notShowIntervalsMenu = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
