import 'package:flutter/material.dart';
import 'package:podcast_app/components/input_text.dart';

class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  State<PageSplashScreen> createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         //cobain componentnya disini
         InputText(
            name: 'Nama',
            onChange: (value) {},
            placeholder: 'Masukan Nama Pengguna',
          ),
        ],
      ),
    );
  }
}