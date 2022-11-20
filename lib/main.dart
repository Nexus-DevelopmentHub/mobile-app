import 'package:flutter/material.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/route/router.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create:(_)=>UserProvider()
          )
        ],
        child: MaterialApp(
          title: 'Podcast App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: RoutePage.generateRoute,
          initialRoute: Routes.splash,
          debugShowCheckedModeBanner: false,
        )
    );
  }
}
