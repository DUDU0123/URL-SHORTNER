import 'dart:async';
import 'package:url_shortner/core/utils/message_show_helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionChecker{
  static StreamSubscription<List<ConnectivityResult>>? _subscription;
  static checkConnection()async{
    List<ConnectivityResult> connectionStatus =await Connectivity().checkConnectivity();
    if (connectionStatus.contains(ConnectivityResult.none)) {
      networkErrorShowSnackbar();
    }
  }

  static void listenForConnectionChanges() {
    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> connectionStatus) {
      if (connectionStatus.contains(ConnectivityResult.none)) {
        networkErrorShowSnackbar();
      } else {
        // call the event that you want for fetch data
        
      }
    });
  }

  static void cancelConnectionSubscription() {
    _subscription?.cancel();
  }

  static void networkErrorShowSnackbar({String? message,}){
    MessageShowhelper.showSnackbar(snackBarContent: message??"Please check your network connection");
  }
}