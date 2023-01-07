import 'package:flutter/material.dart';

class CheberTabs extends StatefulWidget {
  const CheberTabs({super.key});

  @override
  State<CheberTabs> createState() => _CheberTabsState();
}

class _CheberTabsState extends State<CheberTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _TabItem(),
          _TabItem(),
          _TabItem(),
        ],
      ),
    );
  }
}

class _TabItem extends StatefulWidget {
  const _TabItem({super.key});

  @override
  State<_TabItem> createState() => __TabItemState();
}

class __TabItemState extends State<_TabItem> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(color: Colors.teal.shade900),
        child: Row(children: [
          const Text("Tab item"),
          const Icon(
            Icons.close,
            size: 16,
          ),
        ]),
      ),
    );
  }
}
