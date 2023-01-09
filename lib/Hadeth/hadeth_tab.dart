import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Hadeth/hadeth_dateils.dart';
import '../my_theme.dart';
import 'hadeth_name.dart';

class HadethTab extends StatelessWidget {
  static const String routeName = 'HadethTab';
  List<HadethName> had = [];

  @override
  Widget build(BuildContext context) {
    if (had.isEmpty) readFile();
    return Column(children: [
      Image.asset('assets/images/hadeth_logo.png'),
      Divider(
        color: MyTheme.colorGold,
        thickness: 1,
      ),
      Text(AppLocalizations.of(context)!.hadeth_name),
      Divider(
        color: MyTheme.colorGold,
        thickness: 1,
      ),
      Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethDetails.routeName,
                    arguments: HadethName(had[index].title, had[index].hadeth));
              },
              child: had.isEmpty?CircularProgressIndicator():Text(had[index].title,textAlign: TextAlign.center));
        },
        itemCount: had.length,
      ))
    ]);
  }

  void readFile() async {
    List<HadethName> hadethTitle = [];
    String allFiles = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadeth = allFiles.trim().split('#');
    for (int i = 0; i < allHadeth.length; i++) {
      List<String> onlyHadeth = allHadeth[i].trim().split('\n');
      String title = onlyHadeth[0];
      onlyHadeth.removeAt(0);
      String content = onlyHadeth.join('\n');
      HadethName h = HadethName(title, content);
      hadethTitle.add(h);
    }
    had = hadethTitle;
  }
}
