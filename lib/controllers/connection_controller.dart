import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digi_store/utils/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController{

  final NetworkConnectivity _connectivity = NetworkConnectivity.instance;
  var connectionstate = true.obs;
 checkConnecton(){
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      if (source.keys.toList()[0] == ConnectivityResult.mobile ||
          source.keys.toList()[0] == ConnectivityResult.wifi) {
        connectionstate.value = true;
        Get.closeAllSnackbars();
      } else {
        connectionstate.value = false;
      }
    });
   print(connectionstate.value);
  }

}