import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start CoinStats Group Code

class CoinStatsGroup {
  static String baseUrl = 'https://api.coinstats.app/public/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };
  static CoinListCall coinListCall = CoinListCall();
  static GetCoinChartCall getCoinChartCall = GetCoinChartCall();
  static GetNewsCall getNewsCall = GetNewsCall();
}

class CoinListCall {
  Future<ApiCallResponse> call({
    int? skip = 0,
    int? limit = 20,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CoinList',
      apiUrl: '${CoinStatsGroup.baseUrl}/coins?skip=${skip}&limit=${limit}\'',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic coin(dynamic response) => getJsonField(
        response,
        r'''$.coins''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].id''',
        true,
      );
  dynamic icon(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].icon''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].name''',
        true,
      );
  dynamic symbol(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].symbol''',
        true,
      );
  dynamic rank(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].rank''',
        true,
      );
  dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].price''',
        true,
      );
  dynamic pricBtc(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].priceBtc''',
        true,
      );
  dynamic volume(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].volume''',
        true,
      );
  dynamic marketCap(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].marketCap''',
        true,
      );
  dynamic price1d(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].priceChange1d''',
        true,
      );
  dynamic price1w(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].priceChange1w''',
        true,
      );
  dynamic price1h(dynamic response) => getJsonField(
        response,
        r'''$.coins[:].priceChange1h''',
        true,
      );
}

class GetCoinChartCall {
  Future<ApiCallResponse> call({
    String? period = '1m',
    String? coinId = 'ethereum',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCoinChart',
      apiUrl:
          '${CoinStatsGroup.baseUrl}/charts?period=${period}&coinId=${coinId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetNewsCall {
  Future<ApiCallResponse> call({
    String? tag = 'handpicked',
    int? skip = 0,
    int? limit = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getNews',
      apiUrl:
          '${CoinStatsGroup.baseUrl}/news/${tag}?skip=${skip}&limit=${limit}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End CoinStats Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
