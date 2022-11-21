import 'package:flutter/material.dart';
import '../components/input_search.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      color: Colors.white,
      child: Column(
        children: [InputSearch()],
      ),
    ));
  }
}
