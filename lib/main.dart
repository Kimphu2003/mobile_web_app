import 'package:flutter/material.dart';
import 'package:mobile_web_app/shell/web_shell.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Web App',
      debugShowCheckedModeBanner: false,
      home: const WebShell(),
    );
  }
}

