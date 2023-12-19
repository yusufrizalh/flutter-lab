import 'package:flutter/material.dart';
import 'package:flutterlab/pages/popup/mytimelinecard.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final timelineCard;

  const MyTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.timelineCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? Colors.red : Colors.red.shade100,
        ),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast ? Colors.red : Colors.red.shade100,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : Colors.red.shade100,
          ),
        ),
        endChild: MyTimelineCard(
          isPast: isPast,
          child: Text(timelineCard),
        ),
      ),
    );
  }
}
