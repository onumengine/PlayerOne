import 'package:flutter/material.dart';
import 'package:player_one/app.dart';
import 'package:player_one/service_locator.dart' as service_locator;

void main() {
  service_locator.init();
  runApp(const App());
}
