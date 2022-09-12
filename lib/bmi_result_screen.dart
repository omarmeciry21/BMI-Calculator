import 'package:flutter/material.dart';

class BMIResult {
  BMIResult({
    required this.state,
    required this.result,
    required this.statement,
  });

  String state;
  String result;
  String statement;
}

class BMIResultScreen extends StatelessWidget {
  late BMIResult bmiResult;
  final double result;

  BMIResultScreen(this.result, {Key? key}) : super(key: key) {
    bmiResult = getBMIResult(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2136),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Your Result",
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            bmiResult.state.toUpperCase(),
                            style: TextStyle(
                                color: result > 24.9 || result < 18.5
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            bmiResult.result.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 65,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            bmiResult.statement,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Color(0xffE83D66),
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Re-Calculate".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 38),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BMIResult getBMIResult(double res) {
    if (res < 18.5) {
      return BMIResult(
          state: "Under-Weight",
          result: res.toStringAsFixed(1),
          statement: "You are under-weight! You need to eat more.");
    } else if (res > 24.9) {
      return BMIResult(
          state: "Normal",
          result: res.toStringAsFixed(1),
          statement: "Your weight is perfect!");
    } else {
      return BMIResult(
          state: "Over-Weight",
          result: res.toStringAsFixed(1),
          statement: "You are over-weight! You need to eat less.");
    }
  }
}
