import 'package:flutter/material.dart';

extension SizedBoxDouble on double {
  SizedBox get h => SizedBox(height: this);
  SizedBox get w => SizedBox(width: this);
}

extension SizedBoxInt on int {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}
