import 'dart:math';
import 'package:bmiapp/constant/constanst.dart';
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
  double height = 170;
  int weight = 20, age = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: AppBar(
        elevation: 3,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff1E1E1E),
        shadowColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gender Selection
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
                ),
              ],
            ),
          ),

          //  Slider
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff333244),
              ),
              child: Column(
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.round().toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Slider(
                    min: 50,
                    max: 200,
                    value: height,
                    thumbColor: kcolorSlider,
                    onChanged: (value) {
                      height = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                // Weight
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff333244),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(color: kText, fontSize: 24),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(color: kText, fontSize: 24),
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (weight > 1) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Age
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff333244),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(color: kText, fontSize: 24),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(color: kText, fontSize: 24),
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (age > 1) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                },
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Calculate Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kcolorSlider,
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () {
              double bmi = weight / pow(height / 100, 2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(result: bmi),
                ),
              );
            },
            child: const Text(
              'Calculate',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
