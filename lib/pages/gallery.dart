import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    tabController.animateTo(0);
  }

  static const List<Tab> tabs = [
    Tab(icon: Icon(Icons.looks_one), child: Text('Tab One')),
    Tab(icon: Icon(Icons.looks_two), text: 'Tab Two'),
    Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
  ];

  static const List<Widget> views = [
    Center(child: Text('Content of Tab One')),
    Center(child: Text('Content of Tab Two')),
    Center(child: Text('Content of Tab Three')),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gallery"),
          centerTitle: true,
          elevation: 12,
          bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            indicatorWeight: 4,
            isScrollable: false,
            physics: const BouncingScrollPhysics(),
            enableFeedback: true,
            controller: tabController,
            tabs: tabs,
            onTap: (int index) {
              debugPrint('Tab $index is tapped');
            },
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: views,
        ),
      ),
    );
  }
}
