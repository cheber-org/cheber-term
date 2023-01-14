import 'package:flutter/material.dart';

import '../../../../shared/components/button.dart';

class SaveSettingsFooter extends StatefulWidget {
  const SaveSettingsFooter({
    this.onSave,
    super.key,
  });

  final Function()? onSave;

  @override
  State<SaveSettingsFooter> createState() => _SaveSettingsFooterState();
}

class _SaveSettingsFooterState extends State<SaveSettingsFooter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CheberButton(
          onClick: widget.onSave,
          child: const Text("Save"),
        )
      ],
    );
  }
}
