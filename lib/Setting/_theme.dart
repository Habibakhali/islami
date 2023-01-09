import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Provider/provider_setting.dart';
import 'package:islami/my_theme.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheen extends StatelessWidget {
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
                pro.changeTheme(ThemeMode.light);
              },
              child: pro.current_theme==ThemeMode.light
                  ? isSelected(AppLocalizations.of(context)!.light)
                  : isunSelected(AppLocalizations.of(context)!.light),
            ),
          SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: (){
              pro.changeTheme(ThemeMode.dark);
            },
            child: pro.current_theme==ThemeMode.dark
                ? isSelected(AppLocalizations.of(context)!.dark)
                : isunSelected(AppLocalizations.of(context)!.dark),
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
