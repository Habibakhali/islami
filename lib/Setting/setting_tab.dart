import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Provider/provider_setting.dart';
import 'package:provider/provider.dart';

import '_theme.dart';
import 'item_bottom_sheet.dart';

class SettingTab extends StatelessWidget {
  static const String routeName = 'SettingTab';

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ProviderSetting>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: () {
              bottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(205, 197, 197, 1.0),
              ),
              width: MediaQuery.of(context).size.width * .95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pro.currLang == 'en'
                        ? AppLocalizations.of(context)!.currentlang
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Text(AppLocalizations.of(context)!.theme,
              style:
              Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 24),),
          InkWell(
            onTap: () {
              ThemebottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(205, 197, 197, 1.0),
              ),
              width: MediaQuery.of(context).size.width * .95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pro.current_theme==ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
void ThemebottomSheet(BuildContext c){
    showModalBottomSheet(context: c, builder: (c){
      return ThemeBottomSheen();
    });

}
  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheetItems();
        });
  }
}
