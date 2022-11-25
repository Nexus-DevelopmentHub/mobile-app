import 'package:flutter/material.dart';
import 'package:podcast_app/components/button_primary.dart';
import 'package:podcast_app/components/chip_text.dart';
import 'package:podcast_app/theme/theme.dart';

class PageChooseTopic extends StatefulWidget {
  const PageChooseTopic({Key? key}) : super(key: key);

  @override
  State<PageChooseTopic> createState() => _PageChooseTopicState();
}

class _PageChooseTopicState extends State<PageChooseTopic> {
  var data = [
    "Berita",
    "Anak",
    "Komedi",
    "Motivasi",
    "Budaya",
    "Film TV"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onNeutral,
      appBar: AppBar(
        backgroundColor: onNeutral,
        elevation: 0,
        title: const Text("Pilih kesukaan kamu"),
        leading: IconButton(onPressed: (){

        },
            icon: const Icon(
            Icons.arrow_back
        )),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pilih 3 topik kesukaan kamu.",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Dapatkan rekomendasi podcast terbaik. Jangan khawatir, Kamu bisa mengubahnya nanti.",
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView(
                  primary: true,
                  shrinkWrap: true,
                  children: <Widget>[
                    Wrap(
                      spacing: 4.0,
                      runSpacing: 8.0,
                      children: List<Widget>.generate(data.length, (int index) {
                        return ChipText(name: data[index], selected: index == 2);
                      }
                      ).toList(),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      bottom: 10
                  ),
                  child: ButtonPrimary(
                    name: "Memulai",
                    onClick:(){},
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      bottom: 10
                  ),
                  child: TextButton(
                    onPressed: (){},
                    child: const Text("Nanti"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
