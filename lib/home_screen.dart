import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Hadeth/hadeth_tab.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/Quran/quran_tab.dart';
import 'package:islami/Radio/radio_tab.dart';
import 'package:islami/Sebha/sebha_tab.dart';
import 'package:islami/Setting/setting_tab.dart';
import 'package:provider/provider.dart';

import 'Provider/provider_setting.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currendex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab()
  ];

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ProviderSetting>(context);
    return Stack(
      children: [
        Image.asset(
          pro.current_theme==ThemeMode.light?
          'assets/images/default_bg.png':
          'assets/images/dark_bg.png'
          ,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: MyTheme.colorGold),
            child: BottomNavigationBar(
              onTap: (index) {
                currendex = index;
                setState(() {});
              },
              currentIndex: currendex,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                    label: AppLocalizations.of(context)!.quran_tab),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                    label: AppLocalizations.of(context)!.hadeth_tab),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                    label: AppLocalizations.of(context)!.sebha_tab),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                    label: AppLocalizations.of(context)!.radio_tab),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.setting_tab),
              ],
            ),
          ),
          body: tabs[currendex],
        ),
      ],
    );
  }
}
