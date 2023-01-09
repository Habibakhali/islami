import 'package:flutter/material.dart';
import 'package:islami/Hadeth/hadeth_dateils.dart';
import 'package:islami/Hadeth/hadeth_tab.dart';
import 'package:islami/Provider/provider_setting.dart';
import 'package:islami/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Quran/quran_tab.dart';
import 'package:islami/Radio/radio_tab.dart';
import 'package:islami/Sebha/sebha_tab.dart';
import 'package:islami/Setting/setting_tab.dart';
import 'package:islami/Quran/soura_details.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider<ProviderSetting>(
      create: (BuildContext){
        return ProviderSetting();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ProviderSetting>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // English, no country code
      ],
      locale: Locale(pro.currLang),
      theme: MyTheme.lightMode,
      themeMode: pro.current_theme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SouraDetails.routeNAme:(_)=>SouraDetails(),
        HadethDetails.routeName:(_)=>HadethDetails(),
        QuranTab.routeName:(_)=>QuranTab(),
        SebhaTab.routeName:(_)=>SebhaTab(),
        HadethTab.routeName:(_)=>HadethTab(),
        RadioTab.routeName:(_)=>RadioTab(),
        SettingTab.routeName:(_)=>SettingTab()
      },
    );
  }
}
