
import 'package:flutter/material.dart';
import 'package:test_digistarts/pages/login_page/login_page.dart';
import 'module/service/service_locator.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp( MaterialApp(home: LoginPage()),
  );
}
