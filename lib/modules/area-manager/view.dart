import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/area-manager/models/tab.dart';
import 'package:cheber/modules/plugins/core/settings/view.dart';
import 'package:cheber/modules/plugins/core/terminal/view.dart';
import 'package:cheber/modules/shared/components/tabs.dart';
import 'package:flutter/material.dart';

import '../shared/components/window_bar.dart';

class AreaManagerView extends StatefulWidget {
  const AreaManagerView({super.key});

  @override
  State<AreaManagerView> createState() => _AreaManagerViewState();
}

class _AreaManagerViewState extends State<AreaManagerView> {
  List<TabItem> tabs = [
    const TabItem(title: Text("Term 1"), child: TermView()),
    const TabItem(title: Text("Settings"), child: SettingsView()),
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
              color: AppTheme.of(context).background,
              border: Border(
                bottom: BorderSide(
                  color: HSLColor.fromColor(AppTheme.of(context).background)
                      .withLightness(0.15)
                      .toColor()
                      .withOpacity(1),
                ),
              ),
            ),
            height: Platform.isMacOS ? 38 : 32,
            padding: EdgeInsets.only(left: Platform.isMacOS ? 76 : 0),
            child: WindowBar(
              tabs: CheberTabs(
                onNewTab: () {
                  setState(() {
                    final tabItem = TabItem(
                        title: Text("Term ${tabs.length + 1}"),
                        child: const TermView());
                    tabs.add(tabItem);
                    selectedTab = tabItem;
                  });
                },
                active: selectedTab != null
                    ? _tabs[tabs.indexOf(selectedTab!)]
                    : null,
                tabs: _tabs,
              ),
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              ...tabs.map((tab) => Offstage(
                    offstage: selectedTab != tab,
                    child: tab.child,
                  ))
            ],
          )),
        ],
      )),
    );
  }
}
