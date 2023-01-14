import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/shared/components/tappable.dart';
import 'package:flutter/material.dart';

import '../../themes/models.dart';

class ThemePreviewCard extends StatefulWidget {
  const ThemePreviewCard({
    required this.theme,
    this.onClick,
    this.isActive = false,
    super.key,
  });

  final CheberTheme theme;
  final bool isActive;
  final Function()? onClick;

  @override
  State<ThemePreviewCard> createState() => _ThemePreviewCardState();
}

class _ThemePreviewCardState extends State<ThemePreviewCard> {
  bool isHover = false;

  Widget _builLine(Color? color, [double? width]) {
    return Container(
      width: width ?? 40,
      height: 10,
      decoration: BoxDecoration(
        color: color ?? Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildPreview() {
    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: [
        _builLine(
          widget.theme.black,
        ),
        _builLine(
          widget.theme.white,
        ),
        _builLine(
          widget.theme.red,
        ),
        _builLine(
          widget.theme.green,
        ),
        _builLine(
          widget.theme.yellow,
        ),
        _builLine(
          widget.theme.blue,
        ),
        _builLine(
          widget.theme.magenta,
        ),
        _builLine(
          widget.theme.cyan,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = widget.theme;

    return Tappable(
      onClick: widget.onClick,
      onHover: (state) => setState(() => isHover = state),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          constraints: const BoxConstraints(minWidth: 150, maxWidth: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorUtil(theme.background).withAccent(0.1),
            border: Border.all(
              width: 2,
              color: (widget.isActive
                      ? Theme.of(context).colorScheme.secondary
                      : ColorUtil(theme.background).withAccent(0.2))
                  .withOpacity(isHover ? 0.5 : 1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: _buildPreview(),
              ),
              Text(theme.name ?? ""),
            ],
          )),
    );
  }
}
