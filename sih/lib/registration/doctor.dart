import 'package:flutter/material.dart';
import 'package:sih/chat.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class doctor extends StatefulWidget {
  const doctor({super.key});

  @override
  State<doctor> createState() => _doctorState();
}

TextEditingController named = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController experience = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController descrp = TextEditingController();
bool nameerror2 = false;
bool expe = false;
bool addresse = false;
bool phonee = false;
bool aboute = false;
void doctr(context) async {
  var regbody = {
    "name": named.text,
    "phone": phone.text,
    "experince": experience.text,
    "address": address.text,
    "about": descrp.text,
  };
  var response = await http.post(Uri.parse("http://192.168.177.197:8000/new"),
      headers: {"content-Type": "application/json"}, body: jsonEncode(regbody));

  var jsonResponse = jsonDecode(response.body);

  if (jsonResponse['status']) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const chat()));
  }
}

class _doctorState extends State<doctor> {
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
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "ENTER YOUR DETAILS",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: named,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      hintText: "ENTER YOUR NAME",
                      errorText: nameerror2 ? "ENTER A VALID NAME" : null,
                      suffixIcon: Icon(
                        Icons.account_box_outlined,
                        color: Colors.grey,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      hintText: "ENTER YOUR PHONE",
                      errorText: phonee ? "ENTER A VALID PHONE NUMBER" : null,
                      suffixIcon: Icon(
                        Icons.call,
                        color: Colors.grey,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: experience,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      hintText: "ENTER YOUR EXPERIENCE",
                      errorText: expe ? "ENTER A VALID NUMBER" : null,
                      suffixIcon: Icon(
                        Icons.numbers,
                        color: Colors.grey,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      hintText: "ENTER YOUR ADDRESS",
                      errorText: addresse ? "ENTER A VALID ADDRESS" : null,
                      suffixIcon: Icon(
                        Icons.add_home_work,
                        color: Colors.grey,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: descrp,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      hintText: "ABOUT YOU",
                      errorText: aboute ? "ENTER A VALID TEXT" : null,
                      suffixIcon: Icon(
                        Icons.abc,
                        color: Colors.grey,
                      )),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (named.text.isEmpty) {
                    setState(() {
                      nameerror2 = true;
                    });
                  } else if (experience.text.isEmpty) {
                    setState(() {
                      expe = true;
                    });
                  } else if (phone.text.isEmpty) {
                    setState(() {
                      phonee = true;
                    });
                  } else if (address.text.isEmpty) {
                    setState(() {
                      addresse = true;
                    });
                  } else if (descrp.text.isEmpty) {
                    setState(() {
                      aboute = true;
                    });
                  } else {
                    doctr(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          "Continue",
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
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
