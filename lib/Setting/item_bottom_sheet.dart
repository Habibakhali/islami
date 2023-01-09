import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Provider/provider_setting.dart';
import 'package:islami/my_theme.dart';
import 'package:provider/provider.dart';

class BottomSheetItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ProviderSetting>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
            InkWell(
              onTap: (){
                pro.changeLang('en');
              },
              child: pro.currLang == 'en'
                  ? isSelected(AppLocalizations.of(context)!.currentlang)
                  : isunSelected(AppLocalizations.of(context)!.currentlang),
            ),
          SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: (){
              pro.changeLang('ar');
            },
            child: pro.currLang == 'ar'
                ? isSelected(AppLocalizations.of(context)!.arabic)
                : isunSelected(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget isSelected(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
        style: TextStyle(
          fontSize: 20
        ),),
        Icon(
          Icons.done,
          color: MyTheme.colorGold,
        )
      ],
    );
  }

  Widget isunSelected(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: TextStyle(
              fontSize: 20
          ),),
      ],
    );
  }
}
