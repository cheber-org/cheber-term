import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:cheber/modules/shared/components/tappable.dart';
import 'package:flutter/material.dart';

class CheberIconButton extends StatefulWidget {
  const CheberIconButton({
    this.child,
    this.isActive = false,
    this.onClick,
    super.key,
  });

  final Widget? child;
  final bool isActive;
  final Function()? onClick;

  @override
  State<CheberIconButton> createState() => _CheberIconButtonState();
}

class _CheberIconButtonState extends State<CheberIconButton> {
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
          borderRadius: BorderRadius.circular(4),
          color: ColorUtil(SettingsProvider.of(context).theme.background)
              .withAccent(0.15)
              .withOpacity(isHover || widget.isActive ? 1 : 0),
        ),
        child: widget.child,
      ),
    );
  }
}
