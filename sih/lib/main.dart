import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/registration/doctor.dart';
import 'package:sih/registration/login.dart';
import 'package:sih/welcome.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    wheretogo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffE2DEEE),
          Color(0xffCBDBEA),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Text(
            "PhysioFinder",
            style: TextStyle(
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w400,
              fontSize: 50,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

void wheretogo(context) async {
  var prefs = await SharedPreferences.getInstance();
  var log = prefs.getBool("token");
  if (log != null) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const start()),
      );
    });
  } else {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const welcome()),
      );
    });
  }
}

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffE2DEEE),
          Color(0xffCBDBEA),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                  "assets/images/doctor.png",
                  alignment: Alignment.bottomCenter,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const doctor()),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Doctor",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              child: Image.asset("assets/images/pateint.png"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const login()),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pateint",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
