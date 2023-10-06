import 'package:flutter/material.dart';
import 'package:sih/welcome.dart';

class maesure extends StatelessWidget {
  const maesure({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController height = TextEditingController();
    TextEditingController weight = TextEditingController();
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
            SizedBox(
              height: 50,
            ),
            Text(
              "ENTER YOUR HEIGHT",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: TextField(
                controller: height,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  hintText: "HEIGHT",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "ENTER YOUR WEIGHT",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: TextField(
                controller: weight,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  hintText: "WEIGHT",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const welcome()),
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
                        "Next",
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
          ],
        ),
      ),
    );
  }
}
