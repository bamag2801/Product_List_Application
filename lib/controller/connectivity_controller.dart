import 'dart:async';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController extends GetxController {
  final Connectivity? connectivityService;

  ConnectivityController({this.connectivityService});

  final _isInternetAvailable = false.obs;

  bool get isInternetAvailable => _isInternetAvailable.value;

  set isInternetAvailable(bool value) => _isInternetAvailable.value = value;

  late StreamSubscription streamSubscription;

  void checkInternetConnection() {
    try {
      streamSubscription = connectivityService!.onConnectivityChanged
          .listen((ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          isInternetAvailable = false;
        } else {
          isInternetAvailable = true;
        }
      });
    } catch (error) {
      rethrow;
    }
  }

  void cancelInternetCheckSubscription() {
    streamSubscription.cancel();
  }
}
