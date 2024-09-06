import 'package:flutter/material.dart';

class LayoutOneHelper extends StatefulWidget {
  final Widget mobile;
  final Widget laptop;

  const LayoutOneHelper(
      {super.key, required this.mobile, required this.laptop});

  @override
  State<LayoutOneHelper> createState() => _LayoutOneHelperState();
}

class _LayoutOneHelperState extends State<LayoutOneHelper> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 768) {
        return widget.mobile;
      } else {
        return widget.laptop;
      }
    });
  }
}
