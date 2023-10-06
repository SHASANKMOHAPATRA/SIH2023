import 'package:flutter/material.dart';
import 'package:sih/registration/age.dart';
import 'package:sih/registration/login.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

bool _isObscure1 = true;
TextEditingController email1 = TextEditingController();
TextEditingController passowrd1 = TextEditingController();
TextEditingController name1 = TextEditingController();
bool emailerror1 = false;
bool nameerror = false;
bool passworderror = false;
late SharedPreferences prefs;
late SharedPreferences prefs1;
late SharedPreferences prefs3;

void registeruser(context) async {
  var regbody = {
    "name": name1.text,
    "email": email1.text,
    "password": passowrd1.text,
  };

  var response = await http.post(Uri.parse("http://192.168.177.197:10000/register"),
      headers: {"content-Type": "application/json"}, body: jsonEncode(regbody));

  var jsonResponse = jsonDecode(response.body);

  if (jsonResponse['status']) {
    var msg3 = jsonResponse['msg'];
    var id = jsonResponse['id'];
    print(jsonResponse['msg']);
    prefs3.setString("id", id);
    prefs.setBool("token", true);
    prefs1.setString("msg", msg3);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const age()));
  } else {
    print(jsonResponse['msg']);
    var msg2 = jsonResponse['msg'];

    prefs1.setString("msg", msg2);
    prefs.setBool("token", false);
  }
}

class _signupState extends State<signup> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => prefs1 = value);
    SharedPreferences.getInstance().then((value) => prefs = value);
    SharedPreferences.getInstance().then((value) => prefs3 = value);
  }

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
                height: 160,
              ),
              Text(
                "Create your Account",
                style: TextStyle(
                    fontFamily: "Post",
                    fontWeight: FontWeight.w500,
                    fontSize: 45),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: name1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      hintText: "ENTER YOUR NAME",
                      errorText: nameerror ? "ENTER A VALID NAME" : null,
                      suffixIcon: Icon(
                        Icons.account_box_outlined,
                        color: Colors.grey,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: email1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    hintText: "ENTER EMAIL ADDRESS",
                    errorText: emailerror1 ? "ENTER A VALID EMAIL" : null,
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  obscureText: _isObscure1,
                  controller: passowrd1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    hintText: "ENTER PASSWORD",
                    errorText: passworderror ? "PLEASE ENTER A PASSOWRD" : null,
                    suffixIcon: IconButton(
                      icon: _isObscure1
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        setState(() {
                          _isObscure1 = !_isObscure1;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () async {
                    if (email1.text.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(email1.text)) {
                      setState(() {
                        emailerror1 = true;
                      });
                    } else if (passowrd1.text.isEmpty) {
                      setState(() {
                        emailerror1 = false;
                      passworderror = true;
                      });
                      
                    } else if (name1.text.isEmpty) {
                      setState(() {
                         passworderror = false;
                      nameerror = true;
                      });
                     
                    } else {
                      registeruser(context);
                      prefs2 = await SharedPreferences.getInstance();
                      final snackBar = SnackBar(
                        content: Text(prefs1.getString("msg").toString()),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        nameerror = false;
                      });
                    }
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
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );
                  },
                  child: Text(
                    "Already have an account? Log In",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
