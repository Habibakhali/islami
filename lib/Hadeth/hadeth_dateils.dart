import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../my_theme.dart';
import 'hadeth_name.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadethDetails';

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as HadethName;
    return Stack(
      children: [
        Image.asset('assets/images/default_bg.png'),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromRGBO(248, 248, 248, 1.0),
              ),
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .7,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(arg.title,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black
                    )
                      ,), Icon(Icons.play_circle)],
                  ),
                  Divider(
                    color: MyTheme.colorGold,
                    thickness: 1,
                    endIndent: 30,
                    indent: 30,
                  ),
                  Expanded(child: SingleChildScrollView(child:  Text(
                      arg.hadeth,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
             ))

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
