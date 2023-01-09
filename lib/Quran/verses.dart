import 'package:flutter/material.dart';

class Verses extends StatelessWidget {
String content;
int index;
Verses(this.content,this.index);
  @override
  Widget build(BuildContext context) {
    return Text("$content(${index+1})",
    textAlign: TextAlign.right,
    style: Theme.of(context).textTheme.bodySmall
    );
  }
}
