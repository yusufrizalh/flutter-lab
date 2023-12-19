import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterlab/pages/components/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  final String title;
  const Login({super.key, required this.title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userEmailCtrl = TextEditingController();
  final TextEditingController userPasswordCtrl = TextEditingController();
  bool visible = false;
  final String apiUrl = "http://192.168.1.6/flutter-api/users/";

  @override
  void initState() {
    super.initState();
  }

  loginCheck() async {
    setState(() {
      visible = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var params = "signin.php?user_email=" +
        userEmailCtrl.text +
        "&user_password=" +
        userPasswordCtrl.text;

    try {
      var resp = await http.get(Uri.parse(apiUrl + params));
      if (resp.statusCode == 200) {
        var response = convert.json.decode(resp.body);
        if (response["status"] == "OK") {
          prefs.setBool("login", true);
          setState(() {
            visible = false;
          });
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));
        } else {
          setState(() {
            visible = false;
          });
          showErrorMessage(context, response["message"]);
        }
      }
    } catch (e) {}
  }

  showErrorMessage(BuildContext context, String errorMsg) {
    Widget OkButton = ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text("OK"),
    );
    AlertDialog alertDialog = AlertDialog(
      title: Text("Error"),
      content: Text(errorMsg),
      actions: <Widget>[
        OkButton,
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Signin Page",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: visible,
              child: Container(child: CircularProgressIndicator()),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "User Email:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4)),
                  TextField(
                    controller: userEmailCtrl..text = "admin@admin.com",
                    decoration: InputDecoration(
                      hintText: "Please enter your email address",
                      border: InputBorder.none,
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "User Password:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4)),
                  TextField(
                    controller: userPasswordCtrl..text = "Pa\$\$w0rd",
                    decoration: InputDecoration(
                      hintText: "Please enter your password",
                      border: InputBorder.none,
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                ),
                child: Text(
                  "Signin",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onTap: loginCheck,
            ),
          ],
        ),
      ),
    );
  }
}
