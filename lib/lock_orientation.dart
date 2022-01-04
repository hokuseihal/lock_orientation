import 'dart:async';

import 'package:flutter/services.dart';

const MethodChannel _channel = MethodChannel('lock_orientation');

Future<DeviceOrientation?> getOrientation() async {
  final String? orientation = await _channel.invokeMethod('getOrientation');
  switch (orientation) {
    case 'up':
      return DeviceOrientation.portraitUp;
    case 'down':
      return DeviceOrientation.portraitDown;
    case 'left':
      return DeviceOrientation.landscapeLeft;
    case 'right':
      return DeviceOrientation.landscapeRight;
    default:
      return null;
  }
}

Future<bool> lockOrientation() async {
  DeviceOrientation? _ori = await getOrientation();
  if (_ori != null) {
    SystemChrome.setPreferredOrientations([_ori]);
    return true;
  } else
    return false;
}

Future unlockOrientation() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
  ]);
}
