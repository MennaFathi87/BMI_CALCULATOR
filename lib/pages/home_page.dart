import 'dart:math';

import 'package:bmiapp/pages/result_page.dart';
import 'package:bmiapp/widgets/jender_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? isFemale;
  double hieght = 170;
  int weight = 20, age = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      appBar: AppBar(
        elevation: 3,
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff1E1E1E),
        shadowColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                JenderContainer(
                  isFemal: isFemale,
                  textGender: 'Male',
                  onTap: () {
                    setState(() {
                      isFemale = false;
                    });
                  },
                ),
                JenderContainer(
                  isFemal: isFemale,
                  textGender: 'Female',
                  onTap: () {
                    setState(() {
                      isFemale = true;
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff333244)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      hieght.round().toString(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          hieght.round().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 50),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Slider(
                      min: 50,
                      max: 200,
                      value: hieght,
                      thumbColor: Colors.pink,
                      onChanged: (value) {
                        hieght = value;
                        setState(() {});
                      },
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff333244),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'weight',
                          style: TextStyle(color: Colors.red, fontSize: 24),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  weight++;
                                  setState(() {});
                                },
                                child: Icon(Icons.add)),
                            ElevatedButton(
                                onPressed: () {
                                  weight--;
                                  setState(() {});
                                },
                                child: Icon(Icons.remove)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff333244),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(color: Colors.red, fontSize: 24),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  age++;
                                  setState(() {});
                                },
                                child: Icon(Icons.add)),
                            ElevatedButton(
                                onPressed: () {
                                  age--;
                                  setState(() {});
                                },
                                child: Icon(Icons.remove)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //elavated button

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent, padding: EdgeInsets.all(8)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            result: weight / pow(hieght / 100, 2),
                          )));
            },
            child: Text(
              'Calculate',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
