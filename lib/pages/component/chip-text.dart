import 'package:flutter/material.dart';

class Chiptext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 53,
        height: 28,
        child: Stack(children: <Widget>[
          Positioned(
            top: 24,
            left: 16,
            child: Text('Tag',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.8999999761581421),
                fontFamily: 'Poppins',
                fontSize: 11,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1.8
              ),
            )
          ),
        ]
      )
    );
  }
}
