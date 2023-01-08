import 'package:flutter/material.dart';

class Tappable extends StatefulWidget {
  const Tappable({
    this.child,
    this.disabled = false,
    this.onHover,
    this.onPressed,
    this.onClick,
    super.key,
  });

  final Widget? child;
  final Function(bool)? onHover;
  final Function(bool)? onPressed;
  final Function()? onClick;
  final bool disabled;

  @override
  State<Tappable> createState() => _TappableState();
}

class _TappableState extends State<Tappable> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.disabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onEnter: (_) {
        if (widget.onHover != null) {
          widget.onHover!(true);
        }
      },
      onExit: (_) {
        if (widget.onHover != null) {
          widget.onHover!(false);
        }
      },
      child: GestureDetector(
        onTap: widget.onClick,
        onTapDown: (_) {
          if (widget.onPressed != null) {
            widget.onPressed!(true);
          }
        },
        onTapUp: (_) {
          if (widget.onPressed != null) {
            widget.onPressed!(false);
          }
        },
        onTapCancel: () {
          if (widget.onPressed != null) {
            widget.onPressed!(false);
          }
        },
        child: widget.child,
      ),
    );
  }
}
