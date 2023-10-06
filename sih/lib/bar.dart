import 'package:flutter/material.dart';
import 'package:sih/models/chartmodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class bar extends StatefulWidget {
  const bar({super.key});

  @override
  State<bar> createState() => _barState();
}

class _barState extends State<bar> {
  final List<LiveData> data = [];
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
              "Growth Chart",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 360,
                height: 280,
                color: Colors.white,
                child: SfCartesianChart(
                  margin: EdgeInsets.all(5),
                  borderWidth: 2,
                  borderColor: Colors.red,
                  primaryXAxis: NumericAxis(
                    minimum: 0,
                    maximum: 7,
                    isVisible: true,
                    interval: 1,
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 10000,
                    isVisible: true,
                    interval: 1000,
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
