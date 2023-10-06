import 'package:flutter/material.dart';
import 'package:sih/registration/age.dart';
import 'package:sih/registration/signup.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

bool _isObscure = true;
TextEditingController email = TextEditingController();
TextEditingController passowrd = TextEditingController();
bool emailerror = false;
bool pswd = false;
late SharedPreferences prefs;
late SharedPreferences prefs2;
late SharedPreferences prefs3;

void loginuser(context) async {
  var regbody = {
    "email": email.text,
    "password": passowrd.text,
  };
  var response = await http.post(Uri.parse("http://192.168.177.197:10000/login"),
      headers: {"content-Type": "application/json"}, body: jsonEncode(regbody));

  var jsonResponse = jsonDecode(response.body);

  if (jsonResponse['status']) {
    var msg = jsonResponse['msg'];
    print(jsonResponse['msg']);

    var id = jsonResponse['id'];
    prefs.setBool("token", true);
    prefs2.setString("msg", msg);
    prefs3.setString("id", id);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const age()));
  } else {
    var msg1 = jsonResponse['msg'];
    prefs2.setString("msg", msg1);
    prefs.setBool("token", false);
  }
}

class _loginState extends State<login> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => prefs2 = value);
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
                height: 150,
              ),
              Image.asset("assets/images/welcome.png"),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    hintText: "ENTER EMAIL ADDRESS",
                    errorText: emailerror ? "ENTER A VALID EMAIL" : null,
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
                  obscureText: _isObscure,
                  controller: passowrd,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    hintText: "ENTER PASSWORD",
                    errorText: pswd ? "PLEASE ENTER A PASSOWRD" : null,
                    suffixIcon: IconButton(
                      icon: _isObscure
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
                          _isObscure = !_isObscure;
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
                    if (email.text.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(email.text)) {
                      setState(() {
                        emailerror = true;
                      });
                    } else if (passowrd.text.isEmpty) {
                      setState(() {
                        emailerror = false;
                        pswd = true;
                      });
                    } else {
                      loginuser(context);
                      prefs2 = await SharedPreferences.getInstance();
                      final snackBar = SnackBar(
                        content: Text(prefs2.getString("msg").toString()),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      setState(() {
                        pswd = false;
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
                      MaterialPageRoute(builder: (context) => const signup()),
                    );
                  },
                  child: Text(
                    "Didn't have an account? Sign Up",
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
