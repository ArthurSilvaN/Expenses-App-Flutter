import 'package:flutter/material.dart';

extension MediaQueryContextExtension on BuildContext {
  Size sizeContext() => MediaQuery.of(this).size;
}
