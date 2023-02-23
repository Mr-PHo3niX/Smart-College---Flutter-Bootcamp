import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartcollege/Screens/courses.dart';
import 'package:smartcollege/Screens/home.dart';
import 'package:smartcollege/Screens/profile.dart';

class Nav_main extends StatefulWidget {
  @override
  _Nav_mainState createState() => _Nav_mainState();
}

class _Nav_mainState extends State<Nav_main> {
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getScreen() {
    const List<Widget> screen = [
      HomeScreen(),
      ProfileScreen(),
      CoursesScreen()
    ];
    return IndexedStack(index: screenIndex, children: screen);
  }

  Widget getFooter() {
    List bottomitems = [
      'images/home_icon.svg',
      'images/user_icon.svg',
      'images/play_icon.svg'
    ];

    return Container(
      //width: ,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 30.0,
            offset: Offset(0, -10),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(21),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    screenIndex = 0;
                  });
                },
                child: Column(children: [
                  SvgPicture.asset(bottomitems[0],
                      height: 17.5, color: Colors.black),
                  const SizedBox(height: 5.0),
                ]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    screenIndex = 1;
                  });
                },
                child: Column(children: [
                  SvgPicture.asset(bottomitems[1],
                      height: 17.5, color: Colors.black),
                  const SizedBox(height: 5.0),
                ]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    screenIndex = 2;
                  });
                },
                child: Column(children: [
                  SvgPicture.asset(bottomitems[2],
                      height: 17.5, color: Colors.black),
                  const SizedBox(height: 5.0),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

//

}
