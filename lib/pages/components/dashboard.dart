import 'package:flutter/material.dart';
import 'package:flutterlab/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  userLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomePage(title: "Home Page"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              userLogout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dashboard"),
          ],
        ),
      ),
    );
  }
}
