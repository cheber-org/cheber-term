import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:flutter/material.dart';

class CheberInput extends StatefulWidget {
  const CheberInput({
    this.placeholder,
    this.value,
    this.onChanged,
    super.key,
  });

  final String? placeholder;
  final String? value;
  final Function(String)? onChanged;

  @override
  State<CheberInput> createState() => _CheberInputState();
}

class _CheberInputState extends State<CheberInput> {
  late final controller = TextEditingController(text: widget.value ?? '');

  @override
  void initState() {
    controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(controller.text);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: TextSelectionThemeData(
        cursorColor: SettingsProvider.of(context).theme.foreground,
        selectionColor: SettingsProvider.of(context).theme.foreground,
        selectionHandleColor: SettingsProvider.of(context).theme.foreground,
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration.collapsed(
          hintText: widget.placeholder,
        ).copyWith(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: ColorUtil(SettingsProvider.of(context).theme.background)
                  .withAccent(0.15),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: ColorUtil(SettingsProvider.of(context).theme.background)
                  .withAccent(0.2),
              width: 2,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(top: 10, bottom: 12, left: 8, right: 8),
        ),
      ),
    );
  }
}
