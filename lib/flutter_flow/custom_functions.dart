import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

double? getPriceChange(
  List<double>? data,
  bool? haveAbs,
  int index,
) {
  if (data == null) return 0.0;
  var price1h = data[index];

  if (haveAbs == true) return (price1h).abs();
  return (price1h);
}

String formatPrice(double? price) {
  int decimalPlaces = 0;
  String numberString = price?.toStringAsFixed(20) ?? '0';
  int decimalIndex = numberString.indexOf('.');
  if (decimalIndex == -1) {
    print(0);
  } else {
    for (int i = decimalIndex + 1; i < numberString.length; i++) {
      print(numberString[decimalIndex]);
      if (numberString[i] != '0') {
        decimalPlaces = i;
        break;
      }
    }
  }

  return price?.toStringAsFixed(decimalPlaces) ?? '0';
}

dynamic getCurrentCoinPrice(
  List<double>? data,
  int index,
) {
  // return data.toString();
  if (data == null || data.length <= 0) return '0';
  var price = data[index];
  int decimalPlaces = 0;
  String numberString = price.toStringAsFixed(20);
  int decimalIndex = numberString.indexOf('.');
  if (decimalIndex == -1) {
    print(0);
  } else {
    for (int i = decimalIndex + 1; i < numberString.length; i++) {
      print(numberString[decimalIndex]);
      if (numberString[i] != '0') {
        decimalPlaces = i;
        break;
      }
    }
  }

  return price.toStringAsFixed(decimalPlaces);
}

String? checkType(dynamic data) {
  return data.runtimeType.toString();
}
