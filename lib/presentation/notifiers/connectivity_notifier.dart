import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConnectivityNotifier extends ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  String _connectionResponse = 'You are not connected';
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
    //TODO: Localize
    _connectivityResult = result;
    switch (result) {
      case ConnectivityResult.none:
        _connectionResponse = 'You are not connected';
        _showToast(_connectionResponse, Colors.red);
        break;
      case ConnectivityResult.mobile:
        _connectionResponse = 'Connected to cellular data';
        _showToast(_connectionResponse, Colors.green);
        break;
      case ConnectivityResult.wifi:
        _connectionResponse = 'Connected to WiFi';
        _showToast(_connectionResponse, Colors.green);
        break;
      default:
        _connectionResponse = 'You are not connected';
      // _showToast(_connectionResponse, Colors.red);
    }
    notifyListeners();
  }

  void _showToast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
