import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/area-manager/models/tab.dart';
import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:cheber/modules/plugins/core/settings/view.dart';
import 'package:cheber/modules/plugins/core/terminal/view.dart';
import 'package:cheber/modules/shared/components/icon.dart';
import 'package:cheber/modules/shared/components/icon_button.dart';
import 'package:cheber/modules/shared/components/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../shared/components/window_bar.dart';

class AreaManagerView extends StatefulWidget {
  const AreaManagerView({super.key});

  @override
  State<AreaManagerView> createState() => _AreaManagerViewState();
}

class _AreaManagerViewState extends State<AreaManagerView> {
  List<TabItem> tabs = [
    const TabItem(title: Text("Term 1"), child: TermView()),
  ];
  late TabItem? selectedTab = tabs.isNotEmpty ? tabs.first : null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tabs = tabs
        .map((item) => CheberTab(
            child: item.title,
            onClose: () {
              setState(() {
                if (selectedTab == item) {
                  selectedTab = tabs[tabs.length % tabs.indexOf(item)];
                }
                tabs.removeWhere((tab) => tab == item);
              });
            },
            onClick: () {
              setState(() {
                selectedTab = item;
              });
            }))
        .toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: SettingsProvider.of(context).theme.background,
              border: Border(
                bottom: BorderSide(
                  color:
                      ColorUtil(SettingsProvider.of(context).theme.background)
                          .withAccent(0.15)
                          .withOpacity(1),
                ),
              ),
            ),
            height: 38,
            padding: EdgeInsets.only(left: Platform.isMacOS ? 76 : 0, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CheberTabs(
                    onNewTab: () {
                      setState(() {
                        final tabItem = TabItem(
                            title: Text("Term ${tabs.length + 1}"),
                            child: TermView());
                        tabs.add(tabItem);
                        selectedTab = tabItem;
                      });
                    },
                    active:
                        selectedTab != null && selectedTab?.child is TermView
                            ? _tabs[tabs.indexOf(selectedTab!)]
                            : null,
                    tabs: _tabs,
                  ),
                ),
                CheberIconButton(
                  isActive: selectedTab?.child is SettingsView,
                  onClick: () {
                    setState(() {
                      selectedTab = const TabItem(
                        title: Text("Settings"),
                        child: SettingsView(),
                      );
                    });
                  },
                  child: CheberIcon(CheberIcons.settings, size: 16),
                )
              ],
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              ...tabs.map(
                (tab) => Offstage(
                  offstage: selectedTab != tab,
                  child: tab.child,
                ),
              ),
              if (selectedTab?.child is SettingsView)
                Offstage(
                  offstage: false,
                  child: selectedTab!.child,
                )
            ],
          )),
        ],
      )),
    );
  }
}
