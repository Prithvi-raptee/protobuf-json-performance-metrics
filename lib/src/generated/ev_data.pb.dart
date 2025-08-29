// This is a generated file - do not edit.
//
// Generated from ev_data.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Vector3 extends $pb.GeneratedMessage {
  factory Vector3({
    $core.double? x,
    $core.double? y,
    $core.double? z,
  }) {
    final result = create();
    if (x != null) result.x = x;
    if (y != null) result.y = y;
    if (z != null) result.z = z;
    return result;
  }

  Vector3._();

  factory Vector3.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Vector3.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Vector3',
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'y', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'z', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Vector3 clone() => Vector3()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Vector3 copyWith(void Function(Vector3) updates) =>
      super.copyWith((message) => updates(message as Vector3)) as Vector3;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Vector3 create() => Vector3._();
  @$core.override
  Vector3 createEmptyInstance() => create();
  static $pb.PbList<Vector3> createRepeated() => $pb.PbList<Vector3>();
  @$core.pragma('dart2js:noInline')
  static Vector3 getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vector3>(create);
  static Vector3? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get z => $_getN(2);
  @$pb.TagNumber(3)
  set z($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => $_clearField(3);
}

class BackendDataPacket extends $pb.GeneratedMessage {
  factory BackendDataPacket({
    $core.double? battery,
    $core.double? throttle,
    $core.double? speed,
    $core.int? dpad,
    $core.int? killSwitch,
    $core.int? lightBeam,
    $core.int? indicators,
    $core.int? sideStand,
    $core.int? absIndication,
    $core.int? modeStatus,
    $core.int? motorStatus,
    $core.int? pduState,
    $core.int? chargingState,
    $core.int? eslState,
    $core.int? brakeStatus,
    $core.double? batteryTemp,
    $core.double? chargingCurrent,
    $core.double? chargingVoltage,
    $core.double? gpsLat,
    $core.double? gpsLng,
    Vector3? acc,
    Vector3? gyro,
    $core.double? odometer,
    $core.double? tripA,
    $core.int? regenLevel,
    $core.double? whpkm,
    $core.int? motorTemp,
    $core.int? chargingModeAC,
    $core.double? batteryVoltage,
    $core.int? motorTorque,
    $core.Iterable<$core.int>? errors,
    $core.Iterable<$core.int>? alerts,
    $core.double? pressureFW,
    $core.double? pressureRW,
    $core.double? tempFW,
    $core.double? tempRW,
    $core.double? batteryFW,
    $core.double? batteryRW,
  }) {
    final result = create();
    if (battery != null) result.battery = battery;
    if (throttle != null) result.throttle = throttle;
    if (speed != null) result.speed = speed;
    if (dpad != null) result.dpad = dpad;
    if (killSwitch != null) result.killSwitch = killSwitch;
    if (lightBeam != null) result.lightBeam = lightBeam;
    if (indicators != null) result.indicators = indicators;
    if (sideStand != null) result.sideStand = sideStand;
    if (absIndication != null) result.absIndication = absIndication;
    if (modeStatus != null) result.modeStatus = modeStatus;
    if (motorStatus != null) result.motorStatus = motorStatus;
    if (pduState != null) result.pduState = pduState;
    if (chargingState != null) result.chargingState = chargingState;
    if (eslState != null) result.eslState = eslState;
    if (brakeStatus != null) result.brakeStatus = brakeStatus;
    if (batteryTemp != null) result.batteryTemp = batteryTemp;
    if (chargingCurrent != null) result.chargingCurrent = chargingCurrent;
    if (chargingVoltage != null) result.chargingVoltage = chargingVoltage;
    if (gpsLat != null) result.gpsLat = gpsLat;
    if (gpsLng != null) result.gpsLng = gpsLng;
    if (acc != null) result.acc = acc;
    if (gyro != null) result.gyro = gyro;
    if (odometer != null) result.odometer = odometer;
    if (tripA != null) result.tripA = tripA;
    if (regenLevel != null) result.regenLevel = regenLevel;
    if (whpkm != null) result.whpkm = whpkm;
    if (motorTemp != null) result.motorTemp = motorTemp;
    if (chargingModeAC != null) result.chargingModeAC = chargingModeAC;
    if (batteryVoltage != null) result.batteryVoltage = batteryVoltage;
    if (motorTorque != null) result.motorTorque = motorTorque;
    if (errors != null) result.errors.addAll(errors);
    if (alerts != null) result.alerts.addAll(alerts);
    if (pressureFW != null) result.pressureFW = pressureFW;
    if (pressureRW != null) result.pressureRW = pressureRW;
    if (tempFW != null) result.tempFW = tempFW;
    if (tempRW != null) result.tempRW = tempRW;
    if (batteryFW != null) result.batteryFW = batteryFW;
    if (batteryRW != null) result.batteryRW = batteryRW;
    return result;
  }

  BackendDataPacket._();

  factory BackendDataPacket.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BackendDataPacket.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BackendDataPacket',
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'battery', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'throttle', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'speed', $pb.PbFieldType.OD)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'dpad', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'killSwitch', $pb.PbFieldType.O3,
        protoName: 'killSwitch')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'lightBeam', $pb.PbFieldType.O3,
        protoName: 'lightBeam')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'indicators', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'sideStand', $pb.PbFieldType.O3,
        protoName: 'sideStand')
    ..a<$core.int>(
        9, _omitFieldNames ? '' : 'absIndication', $pb.PbFieldType.O3,
        protoName: 'absIndication')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'modeStatus', $pb.PbFieldType.O3,
        protoName: 'modeStatus')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'motorStatus', $pb.PbFieldType.O3,
        protoName: 'motorStatus')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'pduState', $pb.PbFieldType.O3,
        protoName: 'pduState')
    ..a<$core.int>(
        13, _omitFieldNames ? '' : 'chargingState', $pb.PbFieldType.O3,
        protoName: 'chargingState')
    ..a<$core.int>(14, _omitFieldNames ? '' : 'eslState', $pb.PbFieldType.O3,
        protoName: 'eslState')
    ..a<$core.int>(15, _omitFieldNames ? '' : 'brakeStatus', $pb.PbFieldType.O3,
        protoName: 'brakeStatus')
    ..a<$core.double>(
        16, _omitFieldNames ? '' : 'batteryTemp', $pb.PbFieldType.OD,
        protoName: 'batteryTemp')
    ..a<$core.double>(
        17, _omitFieldNames ? '' : 'chargingCurrent', $pb.PbFieldType.OD,
        protoName: 'chargingCurrent')
    ..a<$core.double>(
        18, _omitFieldNames ? '' : 'chargingVoltage', $pb.PbFieldType.OD,
        protoName: 'chargingVoltage')
    ..a<$core.double>(19, _omitFieldNames ? '' : 'gpsLat', $pb.PbFieldType.OD,
        protoName: 'gpsLat')
    ..a<$core.double>(20, _omitFieldNames ? '' : 'gpsLng', $pb.PbFieldType.OD,
        protoName: 'gpsLng')
    ..aOM<Vector3>(21, _omitFieldNames ? '' : 'acc', subBuilder: Vector3.create)
    ..aOM<Vector3>(22, _omitFieldNames ? '' : 'gyro',
        subBuilder: Vector3.create)
    ..a<$core.double>(23, _omitFieldNames ? '' : 'odometer', $pb.PbFieldType.OD)
    ..a<$core.double>(24, _omitFieldNames ? '' : 'tripA', $pb.PbFieldType.OD,
        protoName: 'tripA')
    ..a<$core.int>(25, _omitFieldNames ? '' : 'regenLevel', $pb.PbFieldType.O3,
        protoName: 'regenLevel')
    ..a<$core.double>(26, _omitFieldNames ? '' : 'whpkm', $pb.PbFieldType.OD)
    ..a<$core.int>(27, _omitFieldNames ? '' : 'motorTemp', $pb.PbFieldType.O3,
        protoName: 'motorTemp')
    ..a<$core.int>(
        28, _omitFieldNames ? '' : 'chargingModeAC', $pb.PbFieldType.O3,
        protoName: 'chargingModeAC')
    ..a<$core.double>(
        29, _omitFieldNames ? '' : 'batteryVoltage', $pb.PbFieldType.OD,
        protoName: 'batteryVoltage')
    ..a<$core.int>(30, _omitFieldNames ? '' : 'motorTorque', $pb.PbFieldType.O3,
        protoName: 'motorTorque')
    ..p<$core.int>(31, _omitFieldNames ? '' : 'errors', $pb.PbFieldType.K3)
    ..p<$core.int>(32, _omitFieldNames ? '' : 'alerts', $pb.PbFieldType.K3)
    ..a<$core.double>(
        33, _omitFieldNames ? '' : 'pressureFW', $pb.PbFieldType.OD,
        protoName: 'pressureFW')
    ..a<$core.double>(
        34, _omitFieldNames ? '' : 'pressureRW', $pb.PbFieldType.OD,
        protoName: 'pressureRW')
    ..a<$core.double>(35, _omitFieldNames ? '' : 'tempFW', $pb.PbFieldType.OD,
        protoName: 'tempFW')
    ..a<$core.double>(36, _omitFieldNames ? '' : 'tempRW', $pb.PbFieldType.OD,
        protoName: 'tempRW')
    ..a<$core.double>(
        37, _omitFieldNames ? '' : 'batteryFW', $pb.PbFieldType.OD,
        protoName: 'batteryFW')
    ..a<$core.double>(
        38, _omitFieldNames ? '' : 'batteryRW', $pb.PbFieldType.OD,
        protoName: 'batteryRW')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackendDataPacket clone() => BackendDataPacket()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackendDataPacket copyWith(void Function(BackendDataPacket) updates) =>
      super.copyWith((message) => updates(message as BackendDataPacket))
          as BackendDataPacket;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BackendDataPacket create() => BackendDataPacket._();
  @$core.override
  BackendDataPacket createEmptyInstance() => create();
  static $pb.PbList<BackendDataPacket> createRepeated() =>
      $pb.PbList<BackendDataPacket>();
  @$core.pragma('dart2js:noInline')
  static BackendDataPacket getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BackendDataPacket>(create);
  static BackendDataPacket? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get battery => $_getN(0);
  @$pb.TagNumber(1)
  set battery($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBattery() => $_has(0);
  @$pb.TagNumber(1)
  void clearBattery() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get throttle => $_getN(1);
  @$pb.TagNumber(2)
  set throttle($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThrottle() => $_has(1);
  @$pb.TagNumber(2)
  void clearThrottle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get speed => $_getN(2);
  @$pb.TagNumber(3)
  set speed($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSpeed() => $_has(2);
  @$pb.TagNumber(3)
  void clearSpeed() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get dpad => $_getIZ(3);
  @$pb.TagNumber(4)
  set dpad($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDpad() => $_has(3);
  @$pb.TagNumber(4)
  void clearDpad() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get killSwitch => $_getIZ(4);
  @$pb.TagNumber(5)
  set killSwitch($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasKillSwitch() => $_has(4);
  @$pb.TagNumber(5)
  void clearKillSwitch() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get lightBeam => $_getIZ(5);
  @$pb.TagNumber(6)
  set lightBeam($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLightBeam() => $_has(5);
  @$pb.TagNumber(6)
  void clearLightBeam() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get indicators => $_getIZ(6);
  @$pb.TagNumber(7)
  set indicators($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIndicators() => $_has(6);
  @$pb.TagNumber(7)
  void clearIndicators() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get sideStand => $_getIZ(7);
  @$pb.TagNumber(8)
  set sideStand($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSideStand() => $_has(7);
  @$pb.TagNumber(8)
  void clearSideStand() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get absIndication => $_getIZ(8);
  @$pb.TagNumber(9)
  set absIndication($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAbsIndication() => $_has(8);
  @$pb.TagNumber(9)
  void clearAbsIndication() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get modeStatus => $_getIZ(9);
  @$pb.TagNumber(10)
  set modeStatus($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasModeStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearModeStatus() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get motorStatus => $_getIZ(10);
  @$pb.TagNumber(11)
  set motorStatus($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMotorStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearMotorStatus() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get pduState => $_getIZ(11);
  @$pb.TagNumber(12)
  set pduState($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasPduState() => $_has(11);
  @$pb.TagNumber(12)
  void clearPduState() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get chargingState => $_getIZ(12);
  @$pb.TagNumber(13)
  set chargingState($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasChargingState() => $_has(12);
  @$pb.TagNumber(13)
  void clearChargingState() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get eslState => $_getIZ(13);
  @$pb.TagNumber(14)
  set eslState($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasEslState() => $_has(13);
  @$pb.TagNumber(14)
  void clearEslState() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.int get brakeStatus => $_getIZ(14);
  @$pb.TagNumber(15)
  set brakeStatus($core.int value) => $_setSignedInt32(14, value);
  @$pb.TagNumber(15)
  $core.bool hasBrakeStatus() => $_has(14);
  @$pb.TagNumber(15)
  void clearBrakeStatus() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.double get batteryTemp => $_getN(15);
  @$pb.TagNumber(16)
  set batteryTemp($core.double value) => $_setDouble(15, value);
  @$pb.TagNumber(16)
  $core.bool hasBatteryTemp() => $_has(15);
  @$pb.TagNumber(16)
  void clearBatteryTemp() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.double get chargingCurrent => $_getN(16);
  @$pb.TagNumber(17)
  set chargingCurrent($core.double value) => $_setDouble(16, value);
  @$pb.TagNumber(17)
  $core.bool hasChargingCurrent() => $_has(16);
  @$pb.TagNumber(17)
  void clearChargingCurrent() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get chargingVoltage => $_getN(17);
  @$pb.TagNumber(18)
  set chargingVoltage($core.double value) => $_setDouble(17, value);
  @$pb.TagNumber(18)
  $core.bool hasChargingVoltage() => $_has(17);
  @$pb.TagNumber(18)
  void clearChargingVoltage() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.double get gpsLat => $_getN(18);
  @$pb.TagNumber(19)
  set gpsLat($core.double value) => $_setDouble(18, value);
  @$pb.TagNumber(19)
  $core.bool hasGpsLat() => $_has(18);
  @$pb.TagNumber(19)
  void clearGpsLat() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.double get gpsLng => $_getN(19);
  @$pb.TagNumber(20)
  set gpsLng($core.double value) => $_setDouble(19, value);
  @$pb.TagNumber(20)
  $core.bool hasGpsLng() => $_has(19);
  @$pb.TagNumber(20)
  void clearGpsLng() => $_clearField(20);

  @$pb.TagNumber(21)
  Vector3 get acc => $_getN(20);
  @$pb.TagNumber(21)
  set acc(Vector3 value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasAcc() => $_has(20);
  @$pb.TagNumber(21)
  void clearAcc() => $_clearField(21);
  @$pb.TagNumber(21)
  Vector3 ensureAcc() => $_ensure(20);

  @$pb.TagNumber(22)
  Vector3 get gyro => $_getN(21);
  @$pb.TagNumber(22)
  set gyro(Vector3 value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasGyro() => $_has(21);
  @$pb.TagNumber(22)
  void clearGyro() => $_clearField(22);
  @$pb.TagNumber(22)
  Vector3 ensureGyro() => $_ensure(21);

  @$pb.TagNumber(23)
  $core.double get odometer => $_getN(22);
  @$pb.TagNumber(23)
  set odometer($core.double value) => $_setDouble(22, value);
  @$pb.TagNumber(23)
  $core.bool hasOdometer() => $_has(22);
  @$pb.TagNumber(23)
  void clearOdometer() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.double get tripA => $_getN(23);
  @$pb.TagNumber(24)
  set tripA($core.double value) => $_setDouble(23, value);
  @$pb.TagNumber(24)
  $core.bool hasTripA() => $_has(23);
  @$pb.TagNumber(24)
  void clearTripA() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.int get regenLevel => $_getIZ(24);
  @$pb.TagNumber(25)
  set regenLevel($core.int value) => $_setSignedInt32(24, value);
  @$pb.TagNumber(25)
  $core.bool hasRegenLevel() => $_has(24);
  @$pb.TagNumber(25)
  void clearRegenLevel() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.double get whpkm => $_getN(25);
  @$pb.TagNumber(26)
  set whpkm($core.double value) => $_setDouble(25, value);
  @$pb.TagNumber(26)
  $core.bool hasWhpkm() => $_has(25);
  @$pb.TagNumber(26)
  void clearWhpkm() => $_clearField(26);

  @$pb.TagNumber(27)
  $core.int get motorTemp => $_getIZ(26);
  @$pb.TagNumber(27)
  set motorTemp($core.int value) => $_setSignedInt32(26, value);
  @$pb.TagNumber(27)
  $core.bool hasMotorTemp() => $_has(26);
  @$pb.TagNumber(27)
  void clearMotorTemp() => $_clearField(27);

  @$pb.TagNumber(28)
  $core.int get chargingModeAC => $_getIZ(27);
  @$pb.TagNumber(28)
  set chargingModeAC($core.int value) => $_setSignedInt32(27, value);
  @$pb.TagNumber(28)
  $core.bool hasChargingModeAC() => $_has(27);
  @$pb.TagNumber(28)
  void clearChargingModeAC() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.double get batteryVoltage => $_getN(28);
  @$pb.TagNumber(29)
  set batteryVoltage($core.double value) => $_setDouble(28, value);
  @$pb.TagNumber(29)
  $core.bool hasBatteryVoltage() => $_has(28);
  @$pb.TagNumber(29)
  void clearBatteryVoltage() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.int get motorTorque => $_getIZ(29);
  @$pb.TagNumber(30)
  set motorTorque($core.int value) => $_setSignedInt32(29, value);
  @$pb.TagNumber(30)
  $core.bool hasMotorTorque() => $_has(29);
  @$pb.TagNumber(30)
  void clearMotorTorque() => $_clearField(30);

  @$pb.TagNumber(31)
  $pb.PbList<$core.int> get errors => $_getList(30);

  @$pb.TagNumber(32)
  $pb.PbList<$core.int> get alerts => $_getList(31);

  @$pb.TagNumber(33)
  $core.double get pressureFW => $_getN(32);
  @$pb.TagNumber(33)
  set pressureFW($core.double value) => $_setDouble(32, value);
  @$pb.TagNumber(33)
  $core.bool hasPressureFW() => $_has(32);
  @$pb.TagNumber(33)
  void clearPressureFW() => $_clearField(33);

  @$pb.TagNumber(34)
  $core.double get pressureRW => $_getN(33);
  @$pb.TagNumber(34)
  set pressureRW($core.double value) => $_setDouble(33, value);
  @$pb.TagNumber(34)
  $core.bool hasPressureRW() => $_has(33);
  @$pb.TagNumber(34)
  void clearPressureRW() => $_clearField(34);

  @$pb.TagNumber(35)
  $core.double get tempFW => $_getN(34);
  @$pb.TagNumber(35)
  set tempFW($core.double value) => $_setDouble(34, value);
  @$pb.TagNumber(35)
  $core.bool hasTempFW() => $_has(34);
  @$pb.TagNumber(35)
  void clearTempFW() => $_clearField(35);

  @$pb.TagNumber(36)
  $core.double get tempRW => $_getN(35);
  @$pb.TagNumber(36)
  set tempRW($core.double value) => $_setDouble(35, value);
  @$pb.TagNumber(36)
  $core.bool hasTempRW() => $_has(35);
  @$pb.TagNumber(36)
  void clearTempRW() => $_clearField(36);

  @$pb.TagNumber(37)
  $core.double get batteryFW => $_getN(36);
  @$pb.TagNumber(37)
  set batteryFW($core.double value) => $_setDouble(36, value);
  @$pb.TagNumber(37)
  $core.bool hasBatteryFW() => $_has(36);
  @$pb.TagNumber(37)
  void clearBatteryFW() => $_clearField(37);

  @$pb.TagNumber(38)
  $core.double get batteryRW => $_getN(37);
  @$pb.TagNumber(38)
  set batteryRW($core.double value) => $_setDouble(37, value);
  @$pb.TagNumber(38)
  $core.bool hasBatteryRW() => $_has(37);
  @$pb.TagNumber(38)
  void clearBatteryRW() => $_clearField(38);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
