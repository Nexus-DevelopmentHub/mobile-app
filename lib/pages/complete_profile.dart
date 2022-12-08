import 'package:flutter/material.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/components/input_dateofbirth.dart';
import 'package:podcast_app/components/input_gender.dart';
import 'package:podcast_app/components/input_text.dart';
import 'package:podcast_app/components/upload_picture.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/models/user_model.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageCompleteProfile extends StatefulWidget {
  const PageCompleteProfile({Key? key}) : super(key: key);

  @override
  State<PageCompleteProfile> createState() => _PageCompleteProfileState();
}

class _PageCompleteProfileState extends State<PageCompleteProfile> {
  String photourl = "";
  String Nama = "";
  String UserName = "";
  String Gender = "";
  String kota = "";

  saveProfile(){
    context.read<UserProvider>().completeProfile(
      UserModel(
        photoProfile: photourl,
        name: Nama,
        gender: Gender,
        address: kota
      )
    ).then((value) => {
      if(value.success){
        Navigator.of(context).pushNamed(Routes.chooseTopic)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onNeutral,
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: UploadProfilePictureComponent(
                onSuccess: (v) {
                  setState(() {
                    photourl = v;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            InputText(
                name: "*Nama Lengkap",
                onChange: (v) {
                  setState(() {
                    Nama = v;
                  });
                },
                placeholder: "Nama"),
            const SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            InputText(
                name: "*Username",
                onChange: (v) {
                  setState(() {
                    UserName = v;
                  });
                },
                placeholder: "Username kamu"),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8, top: 1),
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
              padding: const EdgeInsets.only(bottom: 8, top: 10),
              child: const InputDateOfBirth(
                  placeholder: (""), name: "*Tahun Lahir"),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8, top: 1),
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
              padding: const EdgeInsets.only(bottom: 15, top: 10),
              child: InputGender(
                label: "*Jenis Kelamin",
                onChange: (v) {
                  setState(() {
                    Gender = v;
                  });
                },
                placeholder: "  Jenis Kelamin",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8, top: 10),
              child: InputText(
                  name: "Kota",
                  onChange: (v) {
                    setState(() {
                      kota = v;
                    });
                  },
                  placeholder: "Asal kota kamu"),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 14, top: 10),
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
                  saveProfile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
