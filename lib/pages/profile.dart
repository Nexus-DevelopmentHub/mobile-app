import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/components/header_profile.dart';
import 'package:podcast_app/components/item_profile.dart';
import 'package:podcast_app/theme/theme.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: onNeutral,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: neutral,
          ),
        ),
      ),
      backgroundColor: onNeutral,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: HeaderProfile(
                  name: 'Mario Prasetyo',
                  image:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDXVBhpoyFQDdjlBcLiiu7i-TU0hlM5iBVdQ&usqp=CAU',
                  placeholder: 'Ubah Profile'),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: 375,
              height: 64,
              color: Colors.grey.shade900,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 8,
                  bottom: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image(
                        height: 40,
                        width: 40,
                        image: AssetImage('lib/icons/vip_one.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      child: Column(
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
              margin: EdgeInsets.only(
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
              margin: EdgeInsets.only(
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
              margin: EdgeInsets.only(
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
              margin: EdgeInsets.only(
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
                    onPressed: () {},
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
