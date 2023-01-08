import 'dart:ui';

import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/shared/components/tappable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheberTabs extends StatefulWidget {
  const CheberTabs({
    required this.tabs,
    this.active,
    this.onNewTab,
    super.key,
  });

  final List<CheberTab> tabs;
  final Function()? onNewTab;
  final CheberTab? active;

  @override
  State<CheberTabs> createState() => _CheberTabsState();
}

class _CheberTabsState extends State<CheberTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ...widget.tabs
              .map(
                (tab) => _TabItem(
                  isActive: widget.active == tab,
                  onClick: tab.onClick,
                  onClose: tab.onClose,
                  child: tab.child,
                ),
              )
              .toList(),
          FractionallySizedBox(
            heightFactor: 1,
            child: _AddTabBtn(
              onClick: widget.onNewTab,
            ),
          )
        ],
      ),
    );
  }
}

class CheberTab {
  const CheberTab({
    required this.child,
    this.onClose,
    this.onClick,
  });
  final Widget child;
  final Function()? onClose;
  final Function()? onClick;
}

class _TabItem extends StatefulWidget {
  const _TabItem({
    required this.child,
    this.isActive = false,
    this.onClick,
    this.onClose,
    super.key,
  });

  final Widget child;
  final bool isActive;
  final Function()? onClick;
  final Function()? onClose;

  @override
  State<_TabItem> createState() => __TabItemState();
}

class __TabItemState extends State<_TabItem> {
  bool isHover = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onHover: (state) => setState(() => isHover = state),
      onPressed: (state) => setState(() => isPressed = state),
      onClick: widget.onClick,
      child: FractionallySizedBox(
        heightFactor: 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              color: HSLColor.fromColor(AppTheme.of(context).background)
                  .withLightness(isPressed || widget.isActive ? 0.15 : 0.13)
                  .toColor()
                  .withOpacity(isHover || widget.isActive ? 1 : 0)),
          child: Row(children: [
            widget.child,
            const SizedBox(
              width: 8,
            ),
            _CloseBtn(
              onClick: widget.onClose,
            )
          ]),
        ),
      ),
    );
  }
}

class _AddTabBtn extends StatefulWidget {
  const _AddTabBtn({
    this.onClick,
    super.key,
  });
  final Function()? onClick;

  @override
  State<_AddTabBtn> createState() => __AddTabBtnState();
}

class __AddTabBtnState extends State<_AddTabBtn> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Tappable(
      onClick: widget.onClick,
      onHover: (state) => setState(() => isHover = state),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: HSLColor.fromColor(AppTheme.of(context).background)
              .withLightness(0.13)
              .toColor()
              .withOpacity(isHover ? 1 : 0),
        ),
        child: const Icon(
          CupertinoIcons.add,
          size: 14,
        ),
      ),
    );
  }
}

class _CloseBtn extends StatefulWidget {
  const _CloseBtn({
    this.onClick,
    super.key,
  });
  final Function()? onClick;

  @override
  State<_CloseBtn> createState() => __CloseBtnState();
}

class __CloseBtnState extends State<_CloseBtn> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onHover: (state) => setState(() => isHover = state),
      onPressed: (state) => setState(() => isHover = state),
      onClick: widget.onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: HSLColor.fromColor(AppTheme.of(context).background)
              .withLightness(0.2)
              .toColor()
              .withOpacity(isHover ? 1 : 0),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(
          CupertinoIcons.clear,
          size: 14,
        ),
      ),
    );
  }
}
