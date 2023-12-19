import 'package:flutter/material.dart';

class MyTimelineCard extends StatelessWidget {
  final bool isPast;
  final child;

  const MyTimelineCard({
    super.key,
    required this.isPast,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(26),
      padding: EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: isPast ? Colors.red.shade300 : Colors.red.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
