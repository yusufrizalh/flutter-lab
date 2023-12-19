import 'package:flutter/material.dart';
import 'package:flutterlab/main.dart';
import 'package:flutterlab/pages/intro/intro1.dart';
import 'package:flutterlab/pages/intro/intro2.dart';
import 'package:flutterlab/pages/intro/intro3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: <Widget>[
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),
          // dot indicator
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip button
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(2);
                  },
                  child: Text("Skip"),
                ),

                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                ),

                // next or last button
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(title: "Home Page"),
                            ),
                          );
                        },
                        child: Text("Done"),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text("Next"),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
