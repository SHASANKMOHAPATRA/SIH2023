import 'package:flutter/material.dart';
import 'package:sih/account.dart';

import 'package:sih/new.dart';
import 'package:sih/next.dart';
import 'package:sih/search.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

int _currentindex = 0;
var pagedata = [welcome(), search(), account()];

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xffE2DEEE),
            Color(0xffCBDBEA),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                  height: 70,
                  width: 370,
                  color: Color(0xffD9D9D9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Take a new reading",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => newr()),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                  height: 70,
                  width: 370,
                  color: Color(0xffD9D9D9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "See Previous Readings",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                  height: 70,
                  width: 370,
                  color: Color(0xffD9D9D9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "See Your Growth Chart",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
              onTap: () {},
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => next()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    color: Color(0xff5262B5),
                  ),
                  height: 67,
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        "Schedule Your Next Session",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 25,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            BottomNavigationBar(
              selectedFontSize: 20,
              unselectedFontSize: 10,
              backgroundColor: Colors.white,
              selectedItemColor: Color.fromARGB(255, 58, 0, 249),
              currentIndex: _currentindex,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: "Search",
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: "Account",
                  backgroundColor: Colors.white,
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentindex = index;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => pagedata[_currentindex]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
