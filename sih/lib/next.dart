import 'package:flutter/material.dart';

class next extends StatefulWidget {
  const next({super.key});

  @override
  State<next> createState() => _nextState();
}

class _nextState extends State<next> {
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
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
              height: 30,
            ),
            Text(
              "Schedule your next session",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Preferred Date",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                controller: date,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  hintText: "ENTER DATE",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Preferred Time",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: TextField(
                controller: time,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  hintText: "ENTER TIME",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
