import 'package:flutter/material.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/components/input_dateofbirth.dart';
import 'package:podcast_app/components/input_gender.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/components/upload.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';

class PageCompleteProfile extends StatefulWidget {
  const PageCompleteProfile({Key? key}) : super(key: key);

  @override
  State<PageCompleteProfile> createState() => _PageCompleteProfileState();
}

class _PageCompleteProfileState extends State<PageCompleteProfile> {
  String photourl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onNeutral,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 8, top: 8),
              child: Upload(
                onSuccess: (v) {},
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            InputText(
                name: "*Nama Lengkap", onChange: (v) {}, placeholder: "Nama"),
            SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            InputText(
                name: "*Username",
                onChange: (v) {},
                placeholder: "Username kamu"),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8, top: 1),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "Username enggak bisa diganti, jadi pastikan sudah sesuai ya!",
                    style: TextStyle(
                      color: subtitle,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8, top: 10),
              child: InputDateOfBirth(placeholder: (""), name: "*Tahun Lahir"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8, top: 1),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "Supaya kami bisa kasih rekomendasi yang sesuai buat kamu!",
                    style: TextStyle(
                      color: subtitle,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15, top: 10),
              child: InputGender(
                label: "*Jenis Kelamin",
                onChange: (v) {},
                placeholder: "  Jenis Kelamin",
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8, top: 10),
              child: InputText(
                  name: "Kota",
                  onChange: (v) {},
                  placeholder: "Asal kota kamu"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 14, top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("  *Harus diisi",
                    style: TextStyle(
                      color: subtitle,
                      height: 0.5,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 3,
                top: 12,
              ),
              child: ButtonPrimary(
                name: "Selesai",
                onClick: () {
                  Navigator.of(context).pushNamed(Routes.chooseTopic);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
