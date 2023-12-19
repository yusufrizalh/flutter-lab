import 'package:flutter/material.dart';
import 'package:flutterlab/pages/popup/mytimelinetile.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timeline"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: <Widget>[
          MyTimelineTile(
            isFirst: true,
            isLast: false,
            isPast: true,
            timelineCard: "Order Placed",
          ),
          MyTimelineTile(
            isFirst: false,
            isLast: false,
            isPast: true,
            timelineCard: "Order Shipped",
          ),
          MyTimelineTile(
            isFirst: false,
            isLast: true,
            isPast: false,
            timelineCard: "Order Delivered",
          ),
        ],
      ),
    );
  }
}
