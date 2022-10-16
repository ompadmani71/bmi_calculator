import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/HomePage.dart';

class ResultScreen extends StatelessWidget {

  ResultScreen({Key? key, required this.age, required this.weight, required this.result, required this.height}) : super(key: key);


  int age,weight;
  double result,height;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff26273A),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 240,
              ),
              Text(
                "Your BMI Score is",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7), fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                result.toStringAsFixed(2),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                setResult(result: result.toDouble()),
//text: bmiscore.toStringAsFixed(2),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color(0xFFEB1555),
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
                  child: Text("RE-CALCULATE",style: const TextStyle(color: Colors.white,fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

setResult({required double result}) {
  if (result < 18.5) {
    return "Underweight";
  } else if (result >= 18.5 && result <= 24.9) {
    return "Normal";
  } else if (result >= 25 && result <= 29.9) {
    return "Overweight";
  } else if (result >= 30 && result <= 34.9) {
    return "Obese";
  } else {
    return "Extremely Obese";
  }
}
