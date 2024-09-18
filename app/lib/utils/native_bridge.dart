import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marvel_app/utils/constants/constants.dart';

class NativeBridge {
  NativeBridge._();

  static NativeBridge? _instance;

  static NativeBridge get instance => _instance ??= NativeBridge._();

  static final MethodChannel _channel = MethodChannel(AppConstants.channelName);
  
  setupMethodChannel() {
    _channel.setMethodCallHandler(
      (MethodCall call) async {
        switch (call.method) {
          case AppConstants.networkChange:
            displayNetworkChangeSnack(call);
            break;
          default:
            throw MissingPluginException();
        }
      } 
    );
  }

  void displayNetworkChangeSnack(MethodCall call) {
    bool isOffline = call.arguments;
    if (isOffline) {
      Get.snackbar('Network change', "You're offline");
    }
    
  }
}