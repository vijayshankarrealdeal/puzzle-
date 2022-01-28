import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PuzzlePlatform {
  static final bool _notMobile =
      kIsWeb || (Platform.isWindows || Platform.isLinux || Platform.isMacOS);

  static String getImagePath() =>
      _notMobile ? 'assets/images/4.jpg' : 'assets/images/2.jpg';

  static double getFontSize(BuildContext context) => _notMobile
      ? MediaQuery.of(context).size.height * 0.18
      : MediaQuery.of(context).size.height * 0.12;
  static double gridBox(BuildContext context) => _notMobile
      ? MediaQuery.of(context).size.height * 0.5
      : MediaQuery.of(context).size.height * 0.12;
}
