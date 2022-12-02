import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class NavigasiBar extends StatefulWidget {
  const NavigasiBar({super.key,this.selected = 0,required this.onItemClicked});

  final Function(int) onItemClicked;
  final int selected;

  @override
  State<NavigasiBar> createState() => _NavigasiBarState();
}

class _NavigasiBarState extends State<NavigasiBar> {

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        currentIndex: widget.selected,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: onSurface,
        selectedItemColor: primary,
        backgroundColor: onNeutral,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_rounded),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          widget.onItemClicked(index);
        },
      );
  }
}
