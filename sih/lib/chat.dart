import 'package:flutter/material.dart';

class chat extends StatelessWidget {
  const chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xffE2DEEE),
            Color(0xffCBDBEA),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Center(
          child: Text(
            "Your chats will appear here",
            style: TextStyle(
                fontFamily: "Inter",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
