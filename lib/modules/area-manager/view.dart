import 'package:cheber/modules/area-manager/models/tab.dart';
import 'package:cheber/modules/plugins/core/settings/view.dart';
import 'package:cheber/modules/plugins/core/terminal/view.dart';
import 'package:cheber/modules/shared/components/icon.dart';
import 'package:cheber/modules/shared/components/icon_button.dart';
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
          WindowBar(
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
              active: selectedTab != null && selectedTab?.child is TermView
                  ? _tabs[tabs.indexOf(selectedTab!)]
                  : null,
              tabs: _tabs,
            ),
            settings: CheberIconButton(
              isActive: selectedTab?.child is SettingsView,
              onClick: () {
                setState(() {
                  selectedTab = const TabItem(
                    title: Text("Settings"),
                    child: SettingsView(),
                  );
                });
              },
              child: const CheberIcon(CheberIcons.settings, size: 16),
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
