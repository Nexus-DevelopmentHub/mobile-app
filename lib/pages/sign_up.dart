import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/components/button_socialgoogle.dart';
import 'package:podcast_app/components/input_password.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageSignUp extends StatefulWidget {
  const PageSignUp({Key? key}) : super(key: key);

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  String name = "";
  String email = "";
  String password = "";

  registerWithEmailAndPassword() {
    context
        .read<UserProvider>()
        .registerWithEmailAndPassword(email, password, name)
        .then((value) => {
              if (value.success)
                {
                  {Navigator.of(context).pushNamed(Routes.completeProfile)}
                }
              else
                {
                  //TO DO KETIKA GAGAL
                }
            });
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: onPrimary,
        body: Container(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 60, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    fontSize: 28, fontWeight: FontWeight.w600, color: surface),
              ),
              const SizedBox(height: 24),
              InputText(
                  name: "Nama",
                  onChange: (v) {
                    setState(() {
                      name = v;
                    });
                  },
                  placeholder: "Nama lengkap"),
              const SizedBox(height: 16),
              InputText(
                  name: "Email",
                  onChange: (v) {
                    setState(() {
                      email = v;
                    });
                  },
                  placeholder: "Masukkan email"),
              const SizedBox(height: 16),
              InputPassword(
                  name: 'Password',
                  onChange: (v) {
                    setState(() {
                      password = v;
                    });
                  },
                  placeholder: 'Masukan Password Kamu'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text(
                      "Saya setuju dengan",
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: surface),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "Syarat & Ketentuan",
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: primary),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "yang berlaku.",
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: surface),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: 327,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 24,
                      width: 1,
                      decoration: BoxDecoration(
                        color: surface,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "OR",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: surface),
                    ),
                    SizedBox(height: 16),
                    ButtonGoogle(
                      name: "Masuk dengan Google",
                      onClick: () {
                        //TODO Handle login google
                      },
                    ),
                    const SizedBox(height: 90),
                    ButtonPrimary(
                      name: "Daftar gratis",
                      onClick:(){
                        registerWithEmailAndPassword();
                      },
                    ),
                    const SizedBox(height: 31),
                    GestureDetector(
                      onTap: () {
                        //TODO Handle jalur masuk ketika sudah punya akun
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
                              "Kamu Sudah Punya Akun?",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: surface),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Masuk disini",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
