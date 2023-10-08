// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

Future initSocketConnection() async {
  print('Connecting to socket');
  FFAppState().chartChannel = WebSocketChannel.connect(
    Uri.parse('wss://stream.binance.com:9443/ws'),
  );
  FFAppState().chartChannel.sink.add(
        jsonEncode(
          {
            "method": "SUBSCRIBE",
            "params": ["btcusdt@aggTrade"],
            "id": 1
          },
        ),
      );
  FFAppState().chartChannel.stream.listen((message) {
    print('===== ' + message);
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
