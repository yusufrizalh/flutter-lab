import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const TextStyle simpleTextStyle = TextStyle(
    fontSize: 16,
  );
  static const TextStyle simpleTextStyleBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Home Page",
            style: simpleTextStyleBold,
          ),
          const Padding(padding: EdgeInsets.only(top: 8, bottom: 8)),
          ElevatedButton(
            onPressed: () {
              // open modal bottom sheet
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.share),
                        title: const Text("Share", style: simpleTextStyle),
                        onTap: () => debugPrint("Share"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.copy),
                        title: const Text("Copy", style: simpleTextStyle),
                        onTap: () => debugPrint("Copy"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text("Edit", style: simpleTextStyle),
                        onTap: () => debugPrint("Edit"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Options"),
          ),
        ],
      ),
    );
  }
}
