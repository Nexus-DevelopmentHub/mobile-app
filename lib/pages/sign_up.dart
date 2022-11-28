import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onPrimary,
      body: Container(
        padding: EdgeInsets.only(right: 24, left: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              name: "Email", onChange: (v) {}, placeholder: "Masukkan email"),
          SizedBox(height: 16),
          InputPassword(
              name: "Password",
              onChange: (v) {},
              placeholder: "Min 6 karakter"),
          SizedBox(height: 16),

          Container(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              Text(
                "Saya setuju dengan Syarat & Ketentuan yang berlaku.",
                style: GoogleFonts.poppins(
                  fontSize: 12, 
                  fontWeight: FontWeight.w500, 
                  color: surface),
              ),
            ],
          ),
          )
        ]),
      ),
    );
  }
}
