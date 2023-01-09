import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = 'SebhaTab';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> items = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله',
  ];
  String dropDownValue = 'سبحان الله';
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                margin: EdgeInsets.only(left: 40),
                child: Image.asset('assets/images/head_sebha_logo.png')),
            Container(
                margin: EdgeInsets.all(75),
                child: InkWell(
                    onTap: () {
                      counter++;
                      angle += 25 / 33;
                      if (counter == 33) {
                        counter = 0;
                        for (int i = 0; i < items.length; i++) {
                          if (dropDownValue == items[i]) {
                            i++;
                            if (i == items.length) i = 0;
                            dropDownValue = items[i];
                          }
                        }
                      }
                      setState(() {});
                    },
                    child: Transform.rotate(
                        angle: pi / 25 * angle,
                        child:
                            Image.asset('assets/images/body_sebha_logo.png')))),
          ],
        ),
        Text(
          AppLocalizations.of(context)!.no_tasbeh,
          textAlign: TextAlign.center,
        ),
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12)),
            child: Center(child: Text('$counter'))),
    Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
    border: Border.all(
    color: Theme.of(context).primaryColor),
    color: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(12)),
    child:DropdownButton(
      dropdownColor: Theme.of(context).primaryColor,
          underline: Text(''),
            value: dropDownValue,
            items: items
                .map((String item) => DropdownMenuItem(
                    value: item,
                    child:  Text(item)))
                .toList(),
            onChanged: (String? newValue) {
              dropDownValue = newValue!;
              counter = 0;
              setState(() {});
            }))
      ],
    );
  }
}
