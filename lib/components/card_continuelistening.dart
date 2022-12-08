import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:podcast_app/theme/theme.dart';

class ContinueListening extends StatefulWidget {
  const ContinueListening(
      {super.key,
      required this.image,
      required this.name,
      required this.percent,
      required this.index,
      required this.totalIndex,
        required this.onClick});

  final VoidCallback onClick;
  final int totalIndex;
  final int index;
  final String image;
  final String name;
  final double percent;

  @override
  State<ContinueListening> createState() => _ContinueListeningState();
}

class _ContinueListeningState extends State<ContinueListening> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        widget.onClick();
      },
      child: Container(
        width: 104,
        height: 167,
        margin: EdgeInsets.only(
            left: (widget.index == 0) ? 24 : 8,
            right: (widget.index == widget.totalIndex - 1) ? 24 : 0),
        child: Column(
          children: [
            SizedBox(
              width: 104,
              height: 104,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(image: NetworkImage(widget.image)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            LinearPercentIndicator(
              barRadius: Radius.circular(8),
              width: 104,
              lineHeight: 8,
              progressColor: primaryContainer,
              backgroundColor: onPrimaryContainer,
              percent: widget.percent,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.name,
              style: TextStyle(
                color: neutral,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
