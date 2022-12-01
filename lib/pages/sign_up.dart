import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/components/button_socialgoogle.dart';
import 'package:podcast_app/components/input_password.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/theme/theme.dart';

class PageSignUp extends StatefulWidget {
  const PageSignUp({Key? key}) : super(key: key);

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  String nama = "";
  String email = "";
  String password = "";

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: onPrimary,
        body: Container(
          padding: EdgeInsets.only(right: 24, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    fontSize: 28, fontWeight: FontWeight.w600, color: surface),
              ),
              SizedBox(height: 23),
              InputText(
                  name: "Nama", onChange: (v) {}, placeholder: "Nama lengkap"),
              SizedBox(height: 16),
              InputText(
                  name: "Email",
                  onChange: (v) {},
                  placeholder: "Masukkan email"),
              SizedBox(height: 16),
              Container(
                child: Container(
                  padding: EdgeInsets.only(top: 2, bottom: 2),
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
                    SizedBox(height: 90),
                    ButtonPrimary(
                      name: "Daftar gratis",
                      onClick: () {
                        //TODO Handle button daftar
                      },
                    ),
                    SizedBox(height: 31),
                    GestureDetector(
                      onTap: () {
                        //TODO Handle jalur masuk ketika sudah punya akun
                      },
                      child: Container(
                        height: 50,
                        width: 328,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
