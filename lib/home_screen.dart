import 'dart:math';

import 'package:bmi_calculator/rounded_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_result_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double thumbValue = 181.0;
  int weightValue = 60;
  int ageValue = 20;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2136),
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff1D2136),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = true;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: isMale
                                    ? Color(0xFF323244)
                                    : Color(0xff24263B),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.mars,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "MALE",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = false;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: !isMale
                                    ? Color(0xFF323244)
                                    : Color(0xff24263B),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.venus,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Female".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFF323244),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "HEIGHT",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 24),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          thumbValue.toInt().toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "cm",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Slider(
                                      value: thumbValue,
                                      min: 100,
                                      max: 210,
                                      thumbColor: Color(0xffE83D66),
                                      activeColor: Color(0xffE83D66),
                                      inactiveColor: Colors.grey,
                                      onChanged: (newValue) {
                                        setState(() {
                                          thumbValue = newValue;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                  Expanded(
                    child: Row(
                      children: [
                        RoundedCustomButton(
                          label: "WEIGHT",
                          value: weightValue,
                          onMinusPressed: () {
                            setState(() {
                              weightValue--;
                            });
                          },
                          onPlusPressed: () {
                            setState(() {
                              weightValue++;
                            });
                          },
                        ),
                        RoundedCustomButton(
                          label: "AGE",
                          value: ageValue,
                          onPlusPressed: () {
                            setState(() {
                              ageValue++;
                            });
                          },
                          onMinusPressed: () {
                            setState(() {
                              ageValue--;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final double result =
                          weightValue / pow(thumbValue / 100, 2);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BMIResultScreen(result)));
                    },
                    child: Container(
                      color: Color(0xffE83D66),
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Calculate".toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 38),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
