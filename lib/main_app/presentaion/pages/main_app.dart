import 'package:flutter/material.dart';
import 'package:test_project/features/login/presentaion/pages/login_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      ///TODO themes and generate route
      home: LoginPage(),
    );
  }
}
