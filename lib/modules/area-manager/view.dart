import 'package:cheber/modules/plugins/core/terminal/view.dart';
import 'package:cheber/modules/shared/components/tabs.dart';
import 'package:flutter/material.dart';

class AreaManagerView extends StatefulWidget {
  const AreaManagerView({super.key});

  @override
  State<AreaManagerView> createState() => _AreaManagerViewState();
}

class _AreaManagerViewState extends State<AreaManagerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 38,
            padding: const EdgeInsets.only(left: 76),
            child: const CheberTabs(),
          ),
          Expanded(
            child: TermView(),
          ),
        ],
      )),
    );
  }
}
