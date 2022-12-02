import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/components/button_socialgoogle.dart';
import 'package:podcast_app/components/input_password.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/style/button_google.dart';
import 'package:podcast_app/theme/theme.dart';

class PageSignIn extends StatefulWidget {
  const PageSignIn({Key? key}) : super(key: key);

  @override
  State<PageSignIn> createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> {
  String emaillogin = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onNeutral,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 30, top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: neutral,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            InputText(
                name: "Email", onChange: (v) {}, placeholder: "Email Kamu"),
            SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            InputPassword(
                name: "Password",
                onChange: (v) {},
                placeholder: "Masukan password kamu"),
            SizedBox(
              height: 40.0,
              width: 10.0,
            ),
            Container(
              child: Row(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Kamu lupa Password?",
                      style: TextStyle(
                        color: neutral,
                        height: -2.0,
                      )),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: onNeutral,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Click disini",
                    style: TextStyle(
                      color: primary,
                      height: -2.0,
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              width: 327,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 27,
                    width: 1,
                    decoration: BoxDecoration(
                      color: surface,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8, top: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: neutral,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 150, top: 10),
              child: ButtonGoogle(name: "Masuk dengan Google"),
            ),
            ButtonPrimary(name: "Masuk",onClick: (){
              Navigator.of(context).pushNamed(Routes.completeProfile);
            },),
            SizedBox(
              height: 10.0,
              width: 10.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                      "Kamu belum punya akun?",
                      style: TextStyle(
                        color: neutral,
                        height: 1,
                      )),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: onNeutral,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Daftar disini",
                      style: TextStyle(
                        color: primary,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
