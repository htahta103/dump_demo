// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SiuStruct extends BaseStruct {
  SiuStruct({
    double? check,
  }) : _check = check;

  // "Check" field.
  double? _check;
  double get check => _check ?? 0.0;
  set check(double? val) => _check = val;
  void incrementCheck(double amount) => _check = check + amount;
  bool hasCheck() => _check != null;

  static SiuStruct fromMap(Map<String, dynamic> data) => SiuStruct(
        check: castToType<double>(data['Check']),
      );

  static SiuStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SiuStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Check': _check,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Check': serializeParam(
          _check,
          ParamType.double,
        ),
      }.withoutNulls;

  static SiuStruct fromSerializableMap(Map<String, dynamic> data) => SiuStruct(
        check: deserializeParam(
          data['Check'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SiuStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SiuStruct && check == other.check;
  }

  @override
  int get hashCode => const ListEquality().hash([check]);
}

SiuStruct createSiuStruct({
  double? check,
}) =>
    SiuStruct(
      check: check,
    );
