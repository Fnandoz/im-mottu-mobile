import 'package:flutter/material.dart';
import 'package:marvel_app/app.dart';
import 'package:marvel_app/utils/native_bridge.dart';

void main() {
  runApp(const MyApp());

  NativeBridge.instance.setupMethodChannel();

  
}