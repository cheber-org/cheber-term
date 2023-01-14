import 'dart:ui';

import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/shared/components/button.dart';
import 'package:flutter/material.dart';

import '../model.dart';

class SettingsPageWrapper extends StatefulWidget {
  const SettingsPageWrapper({
    this.child,
    this.footer,
    super.key,
  });

  final Widget? child;
  final Widget? footer;

  @override
  State<SettingsPageWrapper> createState() => _SettingsPageWrapperState();
}

class _SettingsPageWrapperState extends State<SettingsPageWrapper> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10).copyWith(bottom: 50),
              child: widget.child,
            ),
          ),
        ),
        if (widget.footer != null)
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 14, top: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: ColorUtil(
                                  SettingsProvider.of(context).theme.background)
                              .withAccent(0.2),
                        ),
                      ),
                      color: SettingsProvider.of(context)
                          .theme
                          .background
                          .withOpacity(0.5),
                    ),
                    child: widget.footer,
                  ),
                ),
              ))
      ],
    );
  }
}
