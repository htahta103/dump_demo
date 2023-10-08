// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:candlesticks/candlesticks.dart';

class Chart extends StatefulWidget {
  const Chart({
    Key? key,
    this.width,
    this.height,
    this.data,
  }) : super(key: key);

  final double? width;
  final double? height;
  final dynamic data;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  String currentInterval = "1m";
  @override
  Widget build(BuildContext context) {
    return Candlesticks(
      key: Key('btc' + currentInterval),
      // indicators: indicators,
      candles: [],
      // onLoadMoreCandles: loadMoreCandles,
      // onRemoveIndicator: (String indicator) {
      //   setState(() {
      //     indicators = [...indicators];
      //     indicators.removeWhere((element) => element.name == indicator);
      //   });
      // }
    );
  }
}
