// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';

Future initSocketConnection() async {
  print('Connecting to socket');
  IO.Socket socket = IO.io('wss://stream.binance.com:9443/ws');

  FFAppState().chartData = socket;

  // socket.connect();

  socket.onConnect((_) {
    print('connected to socket');
  });

  // I'm using 3 listeners so adjust to your use case

  socket.on('system_message', (message) {
    print('*** system_message: $message');
  });

  socket.on('stream', (message) {
    print("*** stream: $message");
    // addToChatHistory(message, callbackAction);
  });

  socket.on('chat', (message) {
    print("*** chat: $message");
  });
}

void addToChatHistory(Map<String, dynamic> message, callbackAction) {
  IncomingMessage incomingMessage = IncomingMessage.fromJson(message);
  // My stream msg body has {token: string/null, complete: true/false}, so adjust to your msg body.

  if (incomingMessage.token != null) {
    String? token = incomingMessage.token;
    // FFAppState().updateChatHistoryAtIndex(
    //   FFAppState().chatHistory.length - 1,
    //   (e) {
    //     return e..content = "${e.content}$token";
    //   },
    // );
  }

  callbackAction();
}

class IncomingMessage {
  String? token;
  bool? complete;

  IncomingMessage({this.token, this.complete});

  IncomingMessage.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (token != null) {
      data['token'] = this.token;
    }
    data['complete'] = this.complete;
    return data;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
