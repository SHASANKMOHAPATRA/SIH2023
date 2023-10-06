import 'dart:async';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import 'package:sih/models/chartmodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class newr extends StatefulWidget {
  const newr({Key? key}) : super(key: key);

  @override
  State<newr> createState() => _newrState();
}

class _newrState extends State<newr> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref().child("esp_data");
  late ChartSeriesController _chartSeriesController;

  late List<LiveData> chatData = [];

  @override
  void initState() {
    chatData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    // TODO: implement initState
    super.initState();
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
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 170, 0),
                child: Container(
                  width: 190,
                  height: 30,
                  color: Color.fromARGB(255, 164, 237, 185),
                  child: Text(
                    "DEVICE CONNECTED",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 260, 0),
                child: Container(
                  width: 100,
                  height: 30,
                  color: Color.fromARGB(255, 254, 255, 212),
                  child: Text(
                    "READINGS",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream:
                    FirebaseFirestore.instance.collection('data').snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasError)
                    return Text('Error = ${snapshot.error}');

                  if (snapshot.hasData) {
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (_, i) {
                        final data = docs[i].data();
                        return ListTile(
                          title: Text(data["esp_data"]),
                        );
                      },
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(
                height: 10,
              ),
              SfCartesianChart(
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chatData,
                    color: Colors.red,
                    xValueMapper: (LiveData sales, _) => sales.a,
                    yValueMapper: (LiveData sales, _) => sales.b,
                  )
                ],
                primaryXAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 3,
                    title: AxisTitle(text: 'Time(seconds)')),
                primaryYAxis: NumericAxis(
                    majorTickLines: MajorTickLines(size: 0),
                    axisLine: AxisLine(width: 0),
                    interval: 100,
                    title: AxisTitle(text: 'Readings')),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int time = 19;
  void updateDataSource(Timer timer) {
    chatData.add(LiveData(a: time++, b: math.Random().nextInt(60) + 30));
    chatData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chatData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(a: 10, b: 210),
      LiveData(a: 20, b: 400),
      LiveData(a: 30, b: 300),
      LiveData(a: 40, b: 213),
      LiveData(a: 50, b: 550),
      LiveData(a: 60, b: 470),
      LiveData(a: 70, b: 600),
      LiveData(a: 80, b: 700),
      LiveData(a: 90, b: 680),
      LiveData(a: 100, b: 610),
    ];
  }
}
