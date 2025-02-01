// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CollapsibleTile extends StatelessWidget {
  final Widget? leading;
  final Widget header;
  final List<Widget> content;
  final ExpansionTileController? controller;
  final void Function(bool)? onExpansionChanged;

  const CollapsibleTile({
    super.key,
    this.controller,
    this.leading,
    required this.header,
    required this.content,
    this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: controller,
      leading: leading,
      onExpansionChanged: onExpansionChanged,
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      collapsedBackgroundColor:
          Theme.of(context).colorScheme.secondaryContainer,
      title: header,
      children: content,
    );
  }
}
