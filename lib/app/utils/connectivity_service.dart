import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leaguechamps/app/enums/connection_status.dart';
import 'package:provider/provider.dart';

import '../translations/locale_keys.g.dart';
import 'toast_service.dart';

class ConnectivityService {
  ConnectionStatus _connectionStatus = ConnectionStatus.online;
  ConnectionStatus get connectionStatus => _connectionStatus;

  String _connectionResponse = LocaleKeys.youAreNotConnected.tr();
  String get connectionResponse => _connectionResponse;

  StreamController<ConnectionStatus> connectionStatusController =
      StreamController<ConnectionStatus>();

  int i = 0;

  ConnectivityService() {
    connectionStatusController.add(_connectionStatus);
    Connectivity().onConnectivityChanged.listen((_) async {
      await resultHandler();
    });
  }

  Future<void> resultHandler() async {
    try {
      final _result = await InternetAddress.lookup('google.com');
      if (_result.isNotEmpty && _result[0].rawAddress.isNotEmpty) {
        _connectionSuccess();
      } else {
        _connectionFailed();
      }
    } on SocketException catch (_) {
      _connectionFailed();
    }
  }

  void _connectionSuccess() {
    _connectionStatus = ConnectionStatus.online;
    _connectionResponse = LocaleKeys.connected.tr();
    debugPrint(_connectionResponse + ' ${i++}');
    connectionStatusController.sink.add(_connectionStatus);
    //ToastService.showSuccessToast(_connectionResponse);
  }

  void _connectionFailed() {
    _connectionStatus = ConnectionStatus.offline;
    _connectionResponse = LocaleKeys.youAreNotConnected.tr();
    debugPrint(_connectionResponse + ' ${i++}');
    connectionStatusController.sink.add(_connectionStatus);
    ToastService.showErrorToast(_connectionResponse);
  }

  bool hasConnection() {
    return _connectionStatus == ConnectionStatus.online;
  }
}
