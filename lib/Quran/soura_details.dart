import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Quran/arg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Quran/verses.dart';
import 'package:islami/my_theme.dart';


class SouraDetails extends StatefulWidget {
static const String routeNAme="souraDetails";

  @override
  State<SouraDetails> createState() => _SouraDetailsState();
}

class _SouraDetailsState extends State<SouraDetails> {
List<String>content=[];

  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context)?.settings.arguments as SouraArg;
    if(content.isEmpty){
    loadfile(arg.index);}
    return  Stack(
        children: [
        Image.asset('assets/images/default_bg.png'),
    Scaffold(
    appBar: AppBar(
    title: Text(AppLocalizations.of(context)!.app_title,style: Theme.of(context).textTheme.bodyMedium,),
    ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color.fromRGBO(248, 248, 248, 1.0),
          ),
          width: MediaQuery.of(context).size.width*.8,
          height: MediaQuery.of(context).size.height*.7,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(arg.souraName),
                  Icon(Icons.play_circle)
                ],
              ),
              Divider(
                color: MyTheme.colorGold,
                thickness: 1,
                endIndent: 30,
                indent: 30,
              ),
              Expanded(
                child:
              content.isEmpty?const Center(child: CircularProgressIndicator()):
              ListView.builder(
                    itemCount: content.length,
                    itemBuilder: (context,index){
                  return Verses(content[index], index);
                }),
              )
            ],
          ),
        ),
      )
    ),
    ]);
  }
  void loadfile(int index)async{
    final sourafile=await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines=sourafile.split('\r\n');
    content=lines;
    setState(() {

    });
  }
}
