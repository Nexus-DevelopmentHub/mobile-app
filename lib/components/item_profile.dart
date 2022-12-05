import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class ItemProfile extends StatefulWidget {
  const ItemProfile(
      {super.key,
      required this.name,
      required this.placeholder,
      required this.image,
      required this.onClick});

  final String name;
  final String placeholder;
  final String image;
  final VoidCallback? onClick;

  @override
  State<ItemProfile> createState() => _ItemProfileState();
}

class _ItemProfileState extends State<ItemProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget?.onClick?.call();
      },
      child: Container(
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: neutral,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.placeholder,
                  style: TextStyle(
                    color: subtitle,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
