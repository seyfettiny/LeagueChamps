import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../../app/utils/toast_service.dart';

class ConnectivityNotifier extends ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.bluetooth;
  ConnectivityResult get connectivity => _connectivityResult;
  String _connectionResponse = 'You are not connected';
  String get connectionResponse => _connectionResponse;

  ConnectivityNotifier() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }
  void init() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    resultHandler(result);
  }

  void resultHandler(ConnectivityResult result) {
    _connectivityResult = result;
    switch (result) {
      case ConnectivityResult.none:
        _connectionResponse = 'You are not connected';
        ToastService.showErrorToast(_connectionResponse);
        break;
      case ConnectivityResult.mobile:
        _connectionResponse = 'Connected';
        ToastService.showSuccessToast(_connectionResponse);
        break;
      case ConnectivityResult.wifi:
        _connectionResponse = 'Connected';
        ToastService.showSuccessToast(_connectionResponse);
        break;
      default:
        _connectionResponse = 'You are not connected';
      // _showToast(_connectionResponse, Colors.red);
    }
    notifyListeners();
  }
}
