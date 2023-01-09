import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatefulWidget {
  static const String routeName = 'RadioTab';

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool played = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .width * .40,
        ),
        Image.asset('assets/images/radio_image.png'),
        Text(AppLocalizations.of(context)!.radio_quran),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage('assets/images/Icon metro-next.png',), color: Theme
                .of(context)
                .primaryColor,),
            SizedBox(width: MediaQuery
                .of(context)
                .size
                .width * 0.25),
            InkWell(
                onTap: () {
                  played=!played;
                  setState(() {

                  });
                },
                child:  played ? Icon(Icons.pause,color: Theme.of(context).primaryColor,) : ImageIcon(
                  AssetImage('assets/images/Icon awesome-play.png'),
                  color: Theme
                      .of(context)
                      .primaryColor,)),
            SizedBox(width: MediaQuery
                .of(context)
                .size
                .width * 0.25),
            ImageIcon(
              AssetImage('assets/images/Icon metro-back.png'), color: Theme
                .of(context)
                .primaryColor,),
          ],
        )
      ],
    );
  }
}
