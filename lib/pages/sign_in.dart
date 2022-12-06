import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/components/button_socialgoogle.dart';
import 'package:podcast_app/components/input_password.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/style/button_google.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageSignIn extends StatefulWidget {
  const PageSignIn({Key? key}) : super(key: key);

  @override
  State<PageSignIn> createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> {
  String email = "";
  String password = "";

  showDialogError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 24,
            color: neutral,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Text(
            message,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: neutral,
            ),
          ))
        ],
      ),
      backgroundColor: Colors.red,
    ));
  }

  signInWithGoogle() {
    context.read<UserProvider>().signInWithGoogle().then((value) => {
          if (value.success)
            {
              if (value.shouldCompleteProfile)
                {Navigator.of(context).pushNamed(Routes.completeProfile)}
              else
                {Navigator.of(context).pushNamed(Routes.home)}
            }
          else
            {
              //TO DO KETIKA GAGAL
              showDialogError(
                  'Kayaknya ada yang salah nih, coba kamu cek lagi ya!')
            }
        });
  }

  signInWithEmailAndPassword() {
    context
        .read<UserProvider>()
        .signInWithEmailAndPassword(email, password)
        .then((value) => {
              if (value.success)
                {
                  if (value.shouldCompleteProfile)
                    {Navigator.of(context).pushNamed(Routes.completeProfile)}
                  else
                    {Navigator.of(context).pushNamed(Routes.home)}
                }
              else
                {
                  //TO DO KETIKA GAGAL
                  showDialogError(
                      'Kayaknya ada yang salah nih, coba kamu cek lagi ya!')
                }
            });
  }

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
                name: "Email",
                onChange: (v) {
                  setState(() {
                    email = v;
                  });
                },
                placeholder: "Email Kamu"),
            SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            InputPassword(
                name: "Password",
                onChange: (v) {
                  setState(() {
                    password = v;
                  });
                },
                placeholder: "Masukan password kamu"),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: Row(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Kamu lupa Password?",
                      style: TextStyle(
                        color: neutral,
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
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
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
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8, top: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "OR",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: surface),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              child: ButtonGoogle(
                name: "Masuk dengan Google",
                onClick: () {
                  signInWithGoogle();
                },
              ),
            ),
            const SizedBox(
              height: 76,
            ),
            ButtonPrimary(
              name: "Masuk",
              onClick: () {
                signInWithEmailAndPassword();
              },
            ),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.signUp);
              },
              child: Container(
                height: 50,
                width: 328,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kamu Belum Punya Akun",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: surface),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "Daftar disini",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
