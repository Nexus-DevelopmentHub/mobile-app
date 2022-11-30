import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:podcast_app/theme/theme.dart';

class InputDateOfBirth extends StatefulWidget {
  const InputDateOfBirth(
      {super.key, required this.placeholder, required this.name});

  final String name;
  final String placeholder;

  @override
  State<InputDateOfBirth> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDateOfBirth> {
  TextEditingController Monthcontroller = new TextEditingController();
  TextEditingController Yearcontroller = new TextEditingController();

  List<String> monthList = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
  ];

  List<String> yearList = [
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
  ];

  bool displayMonthList = false;
  bool displayYearList = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name,
              style: TextStyle(
                  color: neutral, fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  InputDateOfBirth("Month", Monthcontroller),
                  SizedBox(
                    height: 4,
                  ),
                  displayMonthList
                      ? SelectionField("Month", Monthcontroller)
                      : SizedBox()
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  InputDateOfBirth("Year", Yearcontroller),
                  SizedBox(
                    height: 4,
                  ),
                  displayYearList
                      ? SelectionField("Year", Yearcontroller)
                      : SizedBox()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget InputDateOfBirth(String type, TextEditingController controller) {
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: onSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        readOnly: true,
        controller: controller,
        style: TextStyle(color: neutral),
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                switch (type) {
                  case "Month":
                    displayMonthList = !displayMonthList;
                    break;
                  case "Year":
                    displayYearList = !displayYearList;
                    break;
                }
              });
            },
            child: Icon(Icons.arrow_drop_down_circle_rounded,
                color: neutral, size: 20),
          ),
          hintText: widget.placeholder,
          hintStyle: TextStyle(color: onSecondary),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget SelectionField(String type, TextEditingController controller) {
    return Container(
      height: 200,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: onSurface, borderRadius: BorderRadius.circular(16)),
      child: ListView.builder(
          itemCount: type == "Month" ? monthList.length : yearList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  switch (type) {
                    case "Month":
                      controller.text = monthList[index];
                      break;
                    case "Year":
                      controller.text = yearList[index];
                      break;
                  }
                });
              },
              child: ListTile(
                title: Text(
                    type == "Month"
                        ? monthList[index]
                        : type == "Year"
                            ? yearList[index]
                            : type,
                    style: TextStyle(color: neutral)),
              ),
            );
          })),
    );
  }
}
