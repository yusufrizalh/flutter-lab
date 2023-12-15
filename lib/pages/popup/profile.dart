import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            snap: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("MyProfile"),
              centerTitle: false,
              background: Image(
                image: AssetImage("images/sliverappbar_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            bottom: AppBar(
              automaticallyImplyLeading: false,
              title: Container(
                height: 50,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter search term",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                  ),
                ),
              ),
            ),
          ),
          // SliverGrid(
          //   delegate: SliverChildBuilderDelegate((context, int index) {
          //     return ListTile(
          //       leading: Container(
          //         padding: EdgeInsets.all(8),
          //         width: 100,
          //         child: Icon(Icons.numbers),
          //       ),
          //       title: Text("Position: ${index}"),
          //     );
          //   }),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     childAspectRatio: 2,
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                return ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    width: 100,
                    child: Icon(Icons.numbers),
                  ),
                  title: Text("Position: ${index}"),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
