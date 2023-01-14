import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:cheber/modules/shared/components/icon.dart';
import 'package:cheber/modules/shared/components/tappable.dart';
import 'package:flutter/material.dart';

class SettingsTabs extends StatefulWidget {
  const SettingsTabs({
    required this.children,
    super.key,
  });
  final List<SettingsTab> children;

  @override
  State<SettingsTabs> createState() => _SettingsTabsState();
}

class _SettingsTabsState extends State<SettingsTabs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          spacing: 6,
          children: widget.children,
        ),
      ),
    );
  }
}

class SettingsTab extends StatefulWidget {
  const SettingsTab({
    required this.icon,
    required this.text,
    this.isActive = false,
    this.onClick,
    super.key,
  });
  final IconData icon;
  final String text;
  final bool isActive;
  final Function()? onClick;

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onClick: widget.onClick,
      onHover: (state) => setState(() => isHover = state),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorUtil(SettingsProvider.of(context).theme.background)
              .withAccent(0.2)
              .withOpacity(isHover || widget.isActive ? 1 : 0),
        ),
        child: Column(
          children: [
            CheberIcon(
              widget.icon,
              size: 23,
              color: DefaultTextStyle.of(context)
                  .style
                  .color!
                  .withOpacity(isHover || widget.isActive ? 1 : 0.7),
            ),
            const SizedBox(
              height: 4,
            ),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              style: TextStyle(
                  fontSize: 13,
                  color: DefaultTextStyle.of(context)
                      .style
                      .color!
                      .withOpacity(isHover || widget.isActive ? 1 : 0.7)),
              child: Text(
                widget.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
