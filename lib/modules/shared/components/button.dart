import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:cheber/modules/shared/components/tappable.dart';
import 'package:flutter/material.dart';

class CheberButton extends StatefulWidget {
  const CheberButton({
    required this.child,
    this.onClick,
    super.key,
  });

  final Widget child;
  final Function()? onClick;

  @override
  State<CheberButton> createState() => _CheberButtonState();
}

class _CheberButtonState extends State<CheberButton> {
  bool isHover = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onClick: widget.onClick,
      onHover: (state) => setState(() => isHover = state),
      onPressed: (state) => setState(() => isPressed = state),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: ColorUtil(SettingsProvider.of(context).theme.background)
              .withAccent(isPressed
                  ? 0.25
                  : isHover
                      ? 0.2
                      : 0.15),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 7),
        curve: Curves.easeInOut,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 14),
          child: widget.child,
        ),
      ),
    );
  }
}
