import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:podcast_app/theme/theme.dart';

class ContinueListening extends StatefulWidget {
  const ContinueListening(
      {super.key,
      required this.image,
      required this.name,
      required this.percent});

  final String image;
  final String name;
  final double percent;

  @override
  State<ContinueListening> createState() => _ContinueListeningState();
}

class _ContinueListeningState extends State<ContinueListening> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 167,
      child: Column(
        children: [
          Container(
            width: 104,
            height: 104,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(image: NetworkImage(widget.image)),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: LinearPercentIndicator(
              barRadius: Radius.circular(8),
              width: 104,
              lineHeight: 8,
              progressColor: primaryContainer,
              backgroundColor: onPrimaryContainer,
              percent: widget.percent,
            ),
          ),
          SizedBox(
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
    );
  }
}
