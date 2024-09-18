import 'package:flutter/material.dart';
import 'package:marvel_app/app.dart';
import 'package:marvel_app/utils/native_bridge.dart';

void main() {

  NativeBridge.instance.setupMethodChannel();

  runApp(const MyApp());
}