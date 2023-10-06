import 'package:flutter/material.dart';

class growth extends StatefulWidget {
  const growth({super.key});

  @override
  State<growth> createState() => _growthState();
}

class _growthState extends State<growth> {
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
              
            ],
          ),
      ),
    );
  }
}