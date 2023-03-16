import 'dart:math';

import 'package:bmicalculator/bmi_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bmicalculator extends StatefulWidget {
  const bmicalculator({Key? key}) : super(key: key);

  @override
  State<bmicalculator> createState() => _bmicalculatorState();
}

class _bmicalculatorState extends State<bmicalculator> {
  late  bool isMale = true;
  double height = 120;
  int male = 20;
  int famele = 50;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("BMI_Calculator"),
      ),
      body: Container(color: Colors.cyan[200],
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale=true;

                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isMale ? Colors.blue : Colors.grey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('images/2.png'),
                                width: 160.0,
                                height: 120,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      onTap: () {setState(() {
                        isMale=false;
                      });},
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: !isMale ? Colors.blue : Colors.grey),
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('images/1.png'),
                                width: 160.0,
                                height: 120,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.grey),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${height.round()}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "CM",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Slider(
                          value: height,
                          max: 220,
                          min: 80,
                          onChanged: (value) {
                            setState(() {
                              height=value;

                            });
                          })
                    ]),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${male}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    male=male-1;
                                  });

                                },
                                child: Icon(Icons.remove),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    male=male+1;
                                  });
                                },
                                child: Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${famele.round()}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    famele=famele-1;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    famele=famele+1;
                                  });
                                },
                                child: Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            )),
            Container(
                color: Colors.blue,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    double result = famele/pow(height/100,2);
                    print(result.round());
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> bmiResult(age:male,result: result.round(),gender: isMale )));
                  },
                  child: Text(
                    "calculator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
