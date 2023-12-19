import 'package:flutter/material.dart';
import 'package:flutterlab/intro.dart';
import 'package:flutterlab/pages/contact.dart';
import 'package:flutterlab/pages/gallery.dart';
import 'package:flutterlab/pages/home.dart';
import 'package:flutterlab/pages/popup/profile.dart';
import 'package:flutterlab/pages/popup/settings.dart';
import 'package:flutterlab/pages/popup/timeline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Lab",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.red,
      ),
      // home: const HomePage(title: "Flutter Lab"),
      home: Intro(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void handleSelectedMenu(String value) {
    switch (value) {
      case "Settings":
        debugPrint("Settings");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Settings(),
          ),
        );
        break;
      case "Profile":
        debugPrint("Profile");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Profile(),
          ),
        );
        break;
      case "Timeline":
        debugPrint("Timeline");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Timeline(),
          ),
        );
        break;
    }
  }

  int selectedDrawerIndex = 0;

  static const TextStyle simpleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const List<Widget> widgetDrawerMenu = <Widget>[
    Expanded(child: Home()),
    Expanded(child: Gallery()),
    // Text("Contact", style: simpleTextStyle),
    Expanded(child: Contact()),
    Text("About", style: simpleTextStyle),
  ];

  void onItemDrawerTap(int index) {
    setState(() {
      selectedDrawerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: simpleTextStyle),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            onPressed: () => debugPrint("Search"),
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(
            onSelected: handleSelectedMenu,
            itemBuilder: (context) {
              return {"Settings", "Profile", "Timeline"}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage("assets/images/drawer-header-red-bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                margin: EdgeInsets.zero,
                accountName: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/WF4t5wG/Whats-App-Image-2021-02-02-at-09-58-37.jpg",
                        ),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 12)),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Yusuf Rizal H."),
                        Text("rizal@inixindo.co.id"),
                      ],
                    ),
                  ],
                ),
                accountEmail: const Text(""),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              selected: selectedDrawerIndex == 0,
              onTap: () {
                onItemDrawerTap(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Gallery"),
              leading: const Icon(Icons.photo),
              selected: selectedDrawerIndex == 1,
              onTap: () {
                onItemDrawerTap(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Contact"),
              leading: const Icon(Icons.email),
              selected: selectedDrawerIndex == 2,
              onTap: () {
                onItemDrawerTap(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("About"),
              leading: const Icon(Icons.info),
              selected: selectedDrawerIndex == 3,
              onTap: () {
                onItemDrawerTap(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widgetDrawerMenu[selectedDrawerIndex],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => debugPrint("Add Something"),
        onPressed: () {
          final mySnackbar = SnackBar(
            content: const Text("Flash message here by snackbar"),
            backgroundColor: Colors.red,
            elevation: 0,
            margin: const EdgeInsets.all(12),
            behavior: SnackBarBehavior.floating,
            showCloseIcon: true,
            closeIconColor: Colors.white,
            dismissDirection: DismissDirection.up,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(mySnackbar);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
