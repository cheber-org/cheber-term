import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/plugins/core/settings/categories/general.dart';
import 'package:cheber/modules/plugins/core/settings/categories/themes.dart';
import 'package:cheber/modules/plugins/core/settings/components/tabs.dart';
import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:cheber/modules/shared/components/icon.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int selectedTab = 0;
  final tabs = const [
    SettingsTabItem(
      child: GeneralSettings(),
      tabIcon: CheberIcons.settings,
      tabText: "General",
    ),
    SettingsTabItem(
      child: ThemesSettings(),
      tabIcon: CheberIcons.paint,
      tabText: "Themes",
    ),
  ];
  Widget buildTabs() {
    return SettingsTabs(
      children: tabs
          .map((item) => SettingsTab(
                icon: item.tabIcon,
                text: item.tabText,
                onClick: () {
                  setState(() {
                    selectedTab = tabs.indexOf(item);
                  });
                },
                isActive: selectedTab == tabs.indexOf(item),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
              color: SettingsProvider.of(context).theme.background),
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: ColorUtil(
                                  SettingsProvider.of(context).theme.background)
                              .withAccent(0.16)),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: buildTabs(),
                ),
              ),
              Expanded(
                child: Stack(
                  children: tabs
                      .map((item) => Offstage(
                            offstage: selectedTab != tabs.indexOf(item),
                            child: item.child,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ));
  }
}

class SettingsTabItem {
  const SettingsTabItem({
    required this.child,
    required this.tabIcon,
    required this.tabText,
    this.footer,
  });

  final Widget child;
  final Widget? footer;
  final IconData tabIcon;
  final String tabText;
}
