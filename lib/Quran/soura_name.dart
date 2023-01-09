import 'package:flutter/material.dart';
import 'package:islami/Quran/arg.dart';
import 'package:islami/Quran/soura_details.dart';

class SouraName extends StatelessWidget {
String souraName;
int index;
SouraName(this.souraName,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, SouraDetails.routeNAme,
          arguments:SouraArg(souraName,index)
          );
        },
        child: Container(child: Text(souraName,textAlign: TextAlign.center,)));
  }
}
