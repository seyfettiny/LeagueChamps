import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'toast_service.dart';

class ConnectivityService extends ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  ConnectivityResult get connectivity => _connectivityResult;
  String _connectionResponse = 'You are not connected';
  String get connectionResponse => _connectionResponse;

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }
  void resultHandler(ConnectivityResult result) {
    //TODO: refactor this
    _connectivityResult = result;
    switch (result) {
      case ConnectivityResult.none:
        _connectionResponse = 'You are not connected';
        ToastService.showErrorToast(_connectionResponse);
        break;
      case ConnectivityResult.mobile:
        final _result = InternetAddress.lookup('google.com');
        _result.then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            _connectionResponse = 'Connected';
            ToastService.showSuccessToast(_connectionResponse);
            notifyListeners();
          } else {
            _connectionResponse = 'You have no internet connection';
            ToastService.showErrorToast(_connectionResponse);
            notifyListeners();
          }
        });
        break;
      case ConnectivityResult.wifi:
        final _result = InternetAddress.lookup('google.com');
        _result.then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            _connectionResponse = 'Connected';
            ToastService.showSuccessToast(_connectionResponse);
            notifyListeners();
          } else {
            _connectionResponse = 'You have no internet connection';
            ToastService.showErrorToast(_connectionResponse);
            notifyListeners();
          }
        });
        break;
      default:
        _connectionResponse = 'You are not connected';
      // _showToast(_connectionResponse, Colors.red);
    }
  }

  bool hasConnection() {
    return _connectivityResult != ConnectivityResult.none;
  }
}
