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
import 'package:flutter/scheduler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:http/http.dart' as http;
import 'package:web_socket_channel/status.dart' as status;

class Chart extends StatefulWidget {
  const Chart({
    Key? key,
    this.width,
    this.height,
    required this.interval,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String interval;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Candle> candles = [];
  void updateCandlesFromSnapshot(newCandle) {
    if (candles.isEmpty) return;
    if (newCandle != null) {
      final map = jsonDecode(newCandle as String) as Map<String, dynamic>;
      if (map.containsKey('k') == true) {
        final candleTicker = CandleTickerModel.fromJson(map);

        // cehck if incoming candle is an update on current last candle, or a new one
        if (candles[0].date == candleTicker.candle.date &&
            candles[0].open == candleTicker.candle.open) {
          // update last candle
          candles[0] = candleTicker.candle;
        }
        // check if incoming new candle is next candle so the difrence
        // between times must be the same as last existing 2 candles
        else if (candleTicker.candle.date.difference(candles[0].date) ==
            candles[0].date.difference(candles[1].date)) {
          // add new candle to list
          candles.insert(0, candleTicker.candle);
        }
        setState(() {});
      }
    }
  }

  void initChanel() {
    FFAppState().chartChannel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );
    FFAppState().chartChannel.sink.add(
          jsonEncode(
            {
              "method": "SUBSCRIBE",
              "params": ["btcusdt@kline_" + widget.interval],
              "id": 1
            },
          ),
        );
    FFAppState().chartChannel.stream.listen((message) {
      print(message);
      updateCandlesFromSnapshot(message);
    });
  }

  Future<void> fetchData() async {
    var response = await callApi('BTCUSDT', widget.interval);
    if ((response?.length > 0)) {
      setState(() {
        candles = mapData(response);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print('===== Siu');
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initChanel();
      fetchData();
    });
  }

  @override
  void didUpdateWidget(covariant Chart oldWidget) {
    print(widget.interval);

    super.didUpdateWidget(oldWidget);
    if (oldWidget.interval != widget.interval) {
      setState(() {
        candles = [];
      });
      FFAppState().chartChannel.sink.close(status.goingAway);
      initChanel();
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Candlesticks(
      key: Key('btc' + widget.interval),
      // indicators: indicators,
      candles: candles,
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

Future<dynamic> callApi(String symbol, String interval) async {
  var url = Uri.parse('https://api1.binance.com/api/v3/klines?symbol=' +
      symbol +
      '&interval=' +
      interval +
      '');

  // Send the GET request
  var response = await http.get(url);

  // If the server returns a 200 OK response, parse the JSON.
  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    return jsonDecode('[]');
  }
}

List<Candle> mapData(List<dynamic>? data) {
  if (data == null) return [];
  return data.map((e) => Candle.fromJson(e)).toList().reversed.toList();
}

class CandleTickerModel {
  final int eventTime;
  final String symbol;
  final Candle candle;

  const CandleTickerModel(
      {required this.eventTime, required this.symbol, required this.candle});

  factory CandleTickerModel.fromJson(Map<String, dynamic> json) {
    return CandleTickerModel(
        eventTime: json['E'] as int,
        symbol: json['s'] as String,
        candle: Candle(
            date: DateTime.fromMillisecondsSinceEpoch(json["k"]["t"]),
            high: double.parse(json["k"]["h"]),
            low: double.parse(json["k"]["l"]),
            open: double.parse(json["k"]["o"]),
            close: double.parse(json["k"]["c"]),
            volume: double.parse(json["k"]["v"])));
  }
}
