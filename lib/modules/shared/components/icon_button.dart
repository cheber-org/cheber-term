import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/shared/components/tappable.dart';
import 'package:flutter/material.dart';

class CheberIconButton extends StatefulWidget {
  const CheberIconButton({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  State<CheberIconButton> createState() => _CheberIconButtonState();
}

class _CheberIconButtonState extends State<CheberIconButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Tappable(
      onHover: (state) => setState(() => isHover = state),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: HSLColor.fromColor(AppTheme.of(context).background).toColor(),
        ),
        child: widget.child,
      ),
    );
  }
}
