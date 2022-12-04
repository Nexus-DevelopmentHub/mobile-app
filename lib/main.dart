import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/data/episode_provider.dart';
import 'package:podcast_app/data/podcast_provider.dart';
import 'package:podcast_app/data/topic_provider.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/firebase_options.dart';
import 'package:podcast_app/route/router.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  ErrorWidget.builder = (details) {
    if (kDebugMode) {
      return ErrorWidget(details.exception);
    }
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('Error!\n${details.exception}'),
      ),
    );
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PodcastProvider()),
        ChangeNotifierProvider(create: (_) => EpisodeProvider()),
        ChangeNotifierProvider(create: (_) => TopicProvider())
      ],
      child: MaterialApp(
        title: 'Podcast App',
        theme: theme,
        onGenerateRoute: RoutePage.generateRoute,
        initialRoute: Routes.splash,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
