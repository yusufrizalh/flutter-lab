import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selectedIndex = 0;

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> bottomNavPages = <Widget>[
    Icon(Icons.key, size: 100, color: Colors.red),
    Icon(Icons.lock, size: 100, color: Colors.red),
    Icon(Icons.chat, size: 100, color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            bottomNavPages.elementAt(selectedIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.key), label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.lock), label: "Privacy"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
        ],
      ),
    );
  }
}
