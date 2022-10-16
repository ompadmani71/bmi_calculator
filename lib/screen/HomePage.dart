import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double? result;

  bool isMale = false;
  bool isFemale = false;

  double sliderValue = 30;
  int weight = 0;
  int age = 0;

  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090E21),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "BMI Calculator",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFemale = false;
                        isMale = false;
                        weight = 0;
                        age = 0;
                        weightController.text = "0";
                        ageController.text = "0";
                        sliderValue = 30.0;
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TweenAnimationBuilder(
                              duration: Duration(seconds: 1),
                              tween: Tween<Offset>(
                                begin: Offset(-60, 0),
                                end: Offset(0, 0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  if (isMale) {
                                    setState(() {
                                      isFemale = !isFemale;
                                      isMale = !isMale;
                                    });
                                  } else {
                                    setState(() {
                                      isFemale = !isFemale;
                                    });
                                  }
                                },
                                child: Container(
                                  // width: 157,
                                  // height: 200,
                                  padding: const EdgeInsets.all(20),
                                  margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1D1E33),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 130,
                                        child: isFemale
                                            ? Image.asset(
                                                "assets/images/Pwoman.png")
                                            : Image.asset(
                                                "assets/images/Wwoman.png"),
                                      ),
                                      const Text(
                                        "Female",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              builder: (context, Offset offset, child) {
                                return Transform.translate(
                                    offset: offset, child: child);
                              },
                            ),
                          ),
                          Expanded(
                            child: TweenAnimationBuilder(
                              duration: Duration(seconds: 1),
                              tween: Tween<Offset>(
                                  begin: Offset(60, 0), end: Offset(0, 0)),
                              child: GestureDetector(
                                onTap: () {
                                  if (isFemale) {
                                    setState(() {
                                      isFemale = !isFemale;
                                      isMale = !isMale;
                                    });
                                  } else {
                                    setState(() {
                                      isMale = !isMale;
                                    });
                                  }
                                },
                                child: Container(
                                  // width: 157,
                                  // height: 200,
                                  padding: const EdgeInsets.all(20),
                                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1D1E33),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 130,
                                        child: isMale
                                            ? Image.asset(
                                                "assets/images/Pmen.png")
                                            : Image.asset(
                                                "assets/images/Wmen.png"),
                                      ),
                                      Text(
                                        "Male",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              builder: (context, Offset offset, child) {
                                return Transform.translate(
                                  offset: offset,
                                  child: child,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      TweenAnimationBuilder(
                        duration: Duration(seconds: 1),
                        tween: Tween<Offset>(begin: Offset(-90, 0),end: Offset(0,0)),
                        child: Container(
                          // height: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFF1D1E33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "HEIGHT",
                                  style: TextStyle(
                                    color: Color(0xFF626473),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text.rich(
                                  TextSpan(
                                      text: "${sliderValue.toInt()}",
                                      style: TextStyle(
                                          fontSize: 50, color: Colors.white),
                                      children: const [
                                        TextSpan(
                                            text: " cm",
                                            style: TextStyle(
                                                color: Color(0xFF626473),
                                                fontSize: 15))
                                      ]),
                                ),
                                SizedBox(height: 25),
                                SliderTheme(
                                  data: const SliderThemeData(
                                    trackHeight: 0.8,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 7),
                                    activeTrackColor: Color(0xFFF5C1D1),
                                    inactiveTrackColor: Color(0xFF555555),
                                    thumbColor: Color(0xFFEB1555),
                                  ),
                                  child: Slider(
                                      max: 300,
                                      value: sliderValue,
                                      onChanged: (sliderData) {
                                        sliderValue = sliderData;
                                        setState(() {});
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        builder: (context, Offset offset, child) {
                          return Transform.translate(
                            offset: offset,
                            child: child,
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TweenAnimationBuilder(
                              duration: Duration(seconds: 1),
                              tween: Tween<Offset>(
                                begin: Offset(-60, 0),
                                end: Offset(0, 0),
                              ),
                              child: Container(
                                // width: 157,
                                // height: 188,
                                padding: EdgeInsets.all(25),
                                margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF1D1E33),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      "Weight",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      controller: weightController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      cursorColor: Color(0xFFEB1555),
                                      textAlign: TextAlign.center,
                                      // onChanged: (value) {
                                      //   setState(() {
                                      //     weightController.text = value;
                                      //     weight = int.parse(value);
                                      //   });
                                      // },
                                      onSubmitted: (value) {
                                        setState(() {
                                          weightController.text = value;
                                          weight = int.parse(value);
                                        });
                                      },
                                    ),
                                    // Text(
                                    //   "$weight",
                                    //   style: const TextStyle(color: Colors.white),
                                    // ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (weight != 0) {
                                              setState(() {
                                                weight--;
                                                weightController.text =
                                                    weight.toString();
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF626473)),
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              setState(() {
                                                weight++;
                                                weightController.text =
                                                    weight.toString();
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF626473)),
                                            child: Icon(Icons.add,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              builder: (context, Offset offset, child) {
                                return Transform.translate(
                                    offset: offset, child: child);
                              },
                            ),
                          ),
                          Expanded(
                            child: TweenAnimationBuilder(
                              duration: Duration(seconds: 1),
                              tween: Tween<Offset>(
                                begin: Offset(60, 0),
                                end: Offset(0, 0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(24),
                                margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF1D1E33),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Age",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 25),
                                    TextField(
                                      controller: ageController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      cursorColor: const Color(0xFFEB1555),
                                      textAlign: TextAlign.center,
                                      // onChanged: (value) {
                                      //   setState(() {
                                      //     ageController.text = value;
                                      //     age = int.parse(value);
                                      //   });
                                      // },
                                      onSubmitted: (value) {
                                        setState(() {
                                          ageController.text = value;
                                          age = int.parse(value);
                                        });
                                      },
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (age != 0) {
                                              setState(() {
                                                age--;
                                                ageController.text =
                                                    age.toString();
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF626473)),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              age++;
                                              ageController.text = age.toString();
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF626473)),
                                            child: Icon(Icons.add,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              builder: (context, Offset offset, child) {
                                return Transform.translate(
                                    offset: offset, child: child);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TweenAnimationBuilder(
              duration: Duration(seconds: 1),
              tween: Tween<Offset>(begin: Offset(0,60),end: Offset(0,0)),
              child: InkWell(
                onTap: () {
                  if (weight > 0 && age > 0 && sliderValue > 30) {
                    result = (weight * 10000) / (sliderValue * sliderValue);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          age: age,
                          result: result!,
                          height: sliderValue,
                          weight: weight,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color(0xff4C4F5E),
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "Wrong Arguments",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color(0xFFEB1555),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  child: const Text("Calculator",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              builder: (context,Offset offset,child){
                return Transform.translate(offset: offset,child: child,);
              },
            ),
          ],
        ),
      ),
    );
  }
}
