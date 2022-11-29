import 'package:flutter/material.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:provider/provider.dart';

class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  State<PageSplashScreen> createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  @override
  void initState() {
    /**
     * when user already logged in redirect to home and otherwise redirect to sign in
     * */ 
    context.read<UserProvider>().checkIsLoggedIn().then((isLoggedIn) => {
      if(isLoggedIn){
        Navigator.of(context).pushNamed(Routes.home)
      }else{
        Navigator.of(context).pushNamed(Routes.signIn)
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
