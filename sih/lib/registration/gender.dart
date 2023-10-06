import 'package:flutter/material.dart';
import 'package:sih/registration/age.dart';



class gender extends StatelessWidget {
  const gender({super.key});

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
              "A few questions to get you started...",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Sex",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        height: 185,
                        width: 185,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Image.asset(
                          "assets/images/male.png",
                          alignment: Alignment.center,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const age()),
                  );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "MALE",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        height: 185,
                        width: 185,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Image.asset(
                          "assets/images/female.png",
                          alignment: Alignment.center,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const age()),
                  );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "FEMALE",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
