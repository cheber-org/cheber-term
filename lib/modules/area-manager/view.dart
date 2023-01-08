import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/area-manager/models/tab.dart';
import 'package:cheber/modules/plugins/core/terminal/view.dart';
import 'package:cheber/modules/shared/components/tabs.dart';
import 'package:flutter/material.dart';

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
    setState(() {
      tabs.add(const TabItem(title: Text("Term 2"), child: TermView()));
    });
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
            decoration: BoxDecoration(color: AppTheme.of(context).background),
            height: 38,
            padding: const EdgeInsets.only(left: 76),
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
              active: selectedTab != null
                  ? _tabs[tabs.indexOf(selectedTab!)]
                  : null,
              tabs: _tabs,
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
