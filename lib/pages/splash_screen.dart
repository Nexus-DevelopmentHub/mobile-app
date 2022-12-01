import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  State<PageSplashScreen> createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  @override
  void initState() {
//  when user already logged in redirect to home and otherwise redirect to sign in

    context.read<UserProvider>().checkIsLoggedIn().then((isLoggedIn) => {
          if (isLoggedIn)
            {Navigator.of(context).pushNamed(Routes.home)}
          else
            {Navigator.of(context).pushNamed(Routes.signIn)}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onNeutral,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 60),
            child: Text(
              'Dengarkan Podcast Terbaik di Opinion.',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: neutral,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Text(
              'Hanya untuk kamu kumpulan podcast terbaik dengan berbagai topik pembahasan disini.',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: subtitle,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('lib/icons/splash.png')],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: ButtonPrimary(
              name: 'Daftar Gratis',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            height: 44,
            width: 321,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Masuk',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: neutral,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
