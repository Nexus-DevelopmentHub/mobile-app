import 'package:flutter/material.dart';
import 'package:podcast_app/components/header_profile.dart';
import 'package:podcast_app/components/item_profile.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/route/routes.dart';
import 'package:podcast_app/theme/alert_dialog.dart';
import 'package:podcast_app/theme/theme.dart';
import 'package:provider/provider.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<UserProvider>().getMyprofile();
    });
    super.initState();
  }

  void signOut() {
    context.read<UserProvider>().signOut().then((value) async => {
          await Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.signIn, (Route<dynamic> route) => false)
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24),
            child: HeaderProfile(
                name: context.watch<UserProvider>().user.name.toString(),
                image:
                    context.watch<UserProvider>().user.photoProfile.toString(),
                placeholder: 'Ubah Profile'
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: 375,
            height: 80,
            color: Colors.grey.shade900,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    height: 40,
                    width: 40,
                    image: AssetImage('lib/icons/vip_one.png'),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kamu belum berlangganan Premier',
                        style: TextStyle(
                            color: neutral,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Aktifkan Premier',
                          style: TextStyle(
                            color: primary,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: ItemProfile(
              name: 'Library Saya',
              placeholder: 'Riwayat podcast dan daftar favoritemu',
              image: 'https://i.ibb.co/5j0KrYK/library.png',
              onClick: () {},
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: ItemProfile(
              name: 'Langganan',
              placeholder: 'Info Premier dan paket lainnya',
              image: 'https://i.ibb.co/B4mQxQG/langganan.png',
              onClick: () {},
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: ItemProfile(
              name: 'Bantuan dan Lainnya',
              placeholder: 'Cari solusi masalahmu di Podcasty',
              image: 'https://i.ibb.co/bLPmS9Z/bantuan.png',
              onClick: () {},
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: ItemProfile(
              name: 'Pengaturan',
              placeholder: 'Pengaturan dan profil perangkatmu',
              image: 'https://i.ibb.co/Fxyj95X/pengaturan.png',
              onClick: () {},
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 48,
                width: 327,
                child: TextButton.icon(
                  onPressed: () async {
                    final action = await AlertDialogs.yesCancelDialog(
                        context,
                        'Logout',
                        'kamu beneran yakin ingin keluar dari aplikasi Opini?');
                    if (action == DialogsAction.yes) {
                      signOut();
                      setState(() => true);
                    } else {
                      setState(() => false);
                    }
                  },
                  icon: Icon(
                    Icons.logout_rounded,
                    color: primary,
                  ),
                  label: Text(
                    'Keluar',
                    style: TextStyle(
                      color: neutral,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
