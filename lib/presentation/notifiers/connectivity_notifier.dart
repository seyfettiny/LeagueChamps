import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityNotifier extends ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  String _connectionResponse = 'No connection';
  String get connectionResponse => _connectionResponse;
  ConnectivityResult get connectivity => _connectivityResult;
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
        _connectionResponse = 'No connection';
        break;
      case ConnectivityResult.mobile:
        _connectionResponse = 'Mobile connection';
        break;
      case ConnectivityResult.wifi:
        _connectionResponse = 'WiFi connection';
        break;
      default:
        _connectionResponse = 'No connection';
    }
    notifyListeners();
  }
}
