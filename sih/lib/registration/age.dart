import 'package:flutter/material.dart';
import 'package:sih/registration/natal.dart';

class age extends StatelessWidget {
  const age({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Age",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
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
                        "Below 18",
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
                  MaterialPageRoute(builder: (context) => const natal()),
                );
              },
            ),
            SizedBox(
              height: 15,
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
                        "18-25",
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
                  MaterialPageRoute(builder: (context) => const natal()),
                );
              },
            ),
            SizedBox(
              height: 15,
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
                        "26-45",
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
                  MaterialPageRoute(builder: (context) => const natal()),
                );
              },
            ),
            SizedBox(
              height: 15,
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
                        "46-56",
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
                  MaterialPageRoute(builder: (context) => const natal()),
                );
              },
            ),
            SizedBox(
              height: 15,
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
                        "Above 56",
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
                  MaterialPageRoute(builder: (context) => const natal()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
