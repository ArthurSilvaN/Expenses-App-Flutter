import 'package:flutter/cupertino.dart';

class PropertyValueNotifier<T> extends ValueNotifier<T> {
  PropertyValueNotifier(T value) : super(value);

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
