import 'package:flutter/material.dart';
class BluetoothConnectionState with ChangeNotifier {

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  bool _isEnabled = false;
  bool get isEnabled => _isEnabled;

  void setBluetoothState(bool state) {
    _isEnabled = state;
    notifyListeners();
  }

  void setConnectionState(bool state) {
    _isConnected = state;
    notifyListeners();
  }
}