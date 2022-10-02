import 'package:flutter/material.dart';
import 'package:player_one/app.dart';
import 'package:player_one/service_locator.dart' as service_locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.init();
  runApp(const App());
}
