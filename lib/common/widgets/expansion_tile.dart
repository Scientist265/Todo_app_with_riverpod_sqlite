import 'package:flutter/material.dart';
import 'package:todo_app_withapi/common/widgets/titles.dart';

import '../utils/constants.dart';

class XpansionTile extends StatelessWidget {
  const XpansionTile(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      this.trailing,
      required this.children});
  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kBklight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConst.kRadius),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: BottomTitles(text: text, text2: text2),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          trailing: trailing,
          controlAffinity: ListTileControlAffinity.trailing,
          children: children,
        ),
      ),
    );
  }
}
