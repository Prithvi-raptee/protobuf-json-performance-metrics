// This is a generated file - do not edit.
//
// Generated from ev_data.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use vector3Descriptor instead')
const Vector3$json = {
  '1': 'Vector3',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 1, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 1, '10': 'y'},
    {'1': 'z', '3': 3, '4': 1, '5': 1, '10': 'z'},
  ],
};

/// Descriptor for `Vector3`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vector3Descriptor = $convert.base64Decode(
    'CgdWZWN0b3IzEgwKAXgYASABKAFSAXgSDAoBeRgCIAEoAVIBeRIMCgF6GAMgASgBUgF6');

@$core.Deprecated('Use backendDataPacketDescriptor instead')
const BackendDataPacket$json = {
  '1': 'BackendDataPacket',
  '2': [
    {'1': 'battery', '3': 1, '4': 1, '5': 1, '10': 'battery'},
    {'1': 'throttle', '3': 2, '4': 1, '5': 1, '10': 'throttle'},
    {'1': 'speed', '3': 3, '4': 1, '5': 1, '10': 'speed'},
    {'1': 'dpad', '3': 4, '4': 1, '5': 5, '10': 'dpad'},
    {'1': 'killSwitch', '3': 5, '4': 1, '5': 5, '10': 'killSwitch'},
    {'1': 'lightBeam', '3': 6, '4': 1, '5': 5, '10': 'lightBeam'},
    {'1': 'indicators', '3': 7, '4': 1, '5': 5, '10': 'indicators'},
    {'1': 'sideStand', '3': 8, '4': 1, '5': 5, '10': 'sideStand'},
    {'1': 'absIndication', '3': 9, '4': 1, '5': 5, '10': 'absIndication'},
    {'1': 'modeStatus', '3': 10, '4': 1, '5': 5, '10': 'modeStatus'},
    {'1': 'motorStatus', '3': 11, '4': 1, '5': 5, '10': 'motorStatus'},
    {'1': 'pduState', '3': 12, '4': 1, '5': 5, '10': 'pduState'},
    {'1': 'chargingState', '3': 13, '4': 1, '5': 5, '10': 'chargingState'},
    {'1': 'eslState', '3': 14, '4': 1, '5': 5, '10': 'eslState'},
    {'1': 'brakeStatus', '3': 15, '4': 1, '5': 5, '10': 'brakeStatus'},
    {'1': 'batteryTemp', '3': 16, '4': 1, '5': 1, '10': 'batteryTemp'},
    {'1': 'chargingCurrent', '3': 17, '4': 1, '5': 1, '10': 'chargingCurrent'},
    {'1': 'chargingVoltage', '3': 18, '4': 1, '5': 1, '10': 'chargingVoltage'},
    {'1': 'gpsLat', '3': 19, '4': 1, '5': 1, '10': 'gpsLat'},
    {'1': 'gpsLng', '3': 20, '4': 1, '5': 1, '10': 'gpsLng'},
    {'1': 'acc', '3': 21, '4': 1, '5': 11, '6': '.Vector3', '10': 'acc'},
    {'1': 'gyro', '3': 22, '4': 1, '5': 11, '6': '.Vector3', '10': 'gyro'},
    {'1': 'odometer', '3': 23, '4': 1, '5': 1, '10': 'odometer'},
    {'1': 'tripA', '3': 24, '4': 1, '5': 1, '10': 'tripA'},
    {'1': 'regenLevel', '3': 25, '4': 1, '5': 5, '10': 'regenLevel'},
    {'1': 'whpkm', '3': 26, '4': 1, '5': 1, '10': 'whpkm'},
    {'1': 'motorTemp', '3': 27, '4': 1, '5': 5, '10': 'motorTemp'},
    {'1': 'chargingModeAC', '3': 28, '4': 1, '5': 5, '10': 'chargingModeAC'},
    {'1': 'batteryVoltage', '3': 29, '4': 1, '5': 1, '10': 'batteryVoltage'},
    {'1': 'motorTorque', '3': 30, '4': 1, '5': 5, '10': 'motorTorque'},
    {'1': 'errors', '3': 31, '4': 3, '5': 5, '10': 'errors'},
    {'1': 'alerts', '3': 32, '4': 3, '5': 5, '10': 'alerts'},
    {'1': 'pressureFW', '3': 33, '4': 1, '5': 1, '10': 'pressureFW'},
    {'1': 'pressureRW', '3': 34, '4': 1, '5': 1, '10': 'pressureRW'},
    {'1': 'tempFW', '3': 35, '4': 1, '5': 1, '10': 'tempFW'},
    {'1': 'tempRW', '3': 36, '4': 1, '5': 1, '10': 'tempRW'},
    {'1': 'batteryFW', '3': 37, '4': 1, '5': 1, '10': 'batteryFW'},
    {'1': 'batteryRW', '3': 38, '4': 1, '5': 1, '10': 'batteryRW'},
  ],
};

/// Descriptor for `BackendDataPacket`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List backendDataPacketDescriptor = $convert.base64Decode(
    'ChFCYWNrZW5kRGF0YVBhY2tldBIYCgdiYXR0ZXJ5GAEgASgBUgdiYXR0ZXJ5EhoKCHRocm90dG'
    'xlGAIgASgBUgh0aHJvdHRsZRIUCgVzcGVlZBgDIAEoAVIFc3BlZWQSEgoEZHBhZBgEIAEoBVIE'
    'ZHBhZBIeCgpraWxsU3dpdGNoGAUgASgFUgpraWxsU3dpdGNoEhwKCWxpZ2h0QmVhbRgGIAEoBV'
    'IJbGlnaHRCZWFtEh4KCmluZGljYXRvcnMYByABKAVSCmluZGljYXRvcnMSHAoJc2lkZVN0YW5k'
    'GAggASgFUglzaWRlU3RhbmQSJAoNYWJzSW5kaWNhdGlvbhgJIAEoBVINYWJzSW5kaWNhdGlvbh'
    'IeCgptb2RlU3RhdHVzGAogASgFUgptb2RlU3RhdHVzEiAKC21vdG9yU3RhdHVzGAsgASgFUgtt'
    'b3RvclN0YXR1cxIaCghwZHVTdGF0ZRgMIAEoBVIIcGR1U3RhdGUSJAoNY2hhcmdpbmdTdGF0ZR'
    'gNIAEoBVINY2hhcmdpbmdTdGF0ZRIaCghlc2xTdGF0ZRgOIAEoBVIIZXNsU3RhdGUSIAoLYnJh'
    'a2VTdGF0dXMYDyABKAVSC2JyYWtlU3RhdHVzEiAKC2JhdHRlcnlUZW1wGBAgASgBUgtiYXR0ZX'
    'J5VGVtcBIoCg9jaGFyZ2luZ0N1cnJlbnQYESABKAFSD2NoYXJnaW5nQ3VycmVudBIoCg9jaGFy'
    'Z2luZ1ZvbHRhZ2UYEiABKAFSD2NoYXJnaW5nVm9sdGFnZRIWCgZncHNMYXQYEyABKAFSBmdwc0'
    'xhdBIWCgZncHNMbmcYFCABKAFSBmdwc0xuZxIaCgNhY2MYFSABKAsyCC5WZWN0b3IzUgNhY2MS'
    'HAoEZ3lybxgWIAEoCzIILlZlY3RvcjNSBGd5cm8SGgoIb2RvbWV0ZXIYFyABKAFSCG9kb21ldG'
    'VyEhQKBXRyaXBBGBggASgBUgV0cmlwQRIeCgpyZWdlbkxldmVsGBkgASgFUgpyZWdlbkxldmVs'
    'EhQKBXdocGttGBogASgBUgV3aHBrbRIcCgltb3RvclRlbXAYGyABKAVSCW1vdG9yVGVtcBImCg'
    '5jaGFyZ2luZ01vZGVBQxgcIAEoBVIOY2hhcmdpbmdNb2RlQUMSJgoOYmF0dGVyeVZvbHRhZ2UY'
    'HSABKAFSDmJhdHRlcnlWb2x0YWdlEiAKC21vdG9yVG9ycXVlGB4gASgFUgttb3RvclRvcnF1ZR'
    'IWCgZlcnJvcnMYHyADKAVSBmVycm9ycxIWCgZhbGVydHMYICADKAVSBmFsZXJ0cxIeCgpwcmVz'
    'c3VyZUZXGCEgASgBUgpwcmVzc3VyZUZXEh4KCnByZXNzdXJlUlcYIiABKAFSCnByZXNzdXJlUl'
    'cSFgoGdGVtcEZXGCMgASgBUgZ0ZW1wRlcSFgoGdGVtcFJXGCQgASgBUgZ0ZW1wUlcSHAoJYmF0'
    'dGVyeUZXGCUgASgBUgliYXR0ZXJ5RlcSHAoJYmF0dGVyeVJXGCYgASgBUgliYXR0ZXJ5Ulc=');
