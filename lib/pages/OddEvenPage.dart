import 'package:flutter/material.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  State<OddEvenPage> createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  String number = "0";
  String checkResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5D3587),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "ODD EVEN CHECKER",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [_display(), _numPad()],
        ),
      ),
    );
  }

  Widget _display() {
    return Container(
      width: 500,
      height: 100,
      margin: EdgeInsets.only(top: 60),
      color: Color(0xFFA367B1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          Text(
            checkResult,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _numPad() {
    return Container(
      width: 400,
      height: 550,
      margin: EdgeInsets.only(top: 25),
      child: GridView.count(
        primary: false,
        crossAxisCount: 3,
        children: [
          _numberContainer("7"),
          _numberContainer("8"),
          _numberContainer("9"),
          _numberContainer("4"),
          _numberContainer("5"),
          _numberContainer("6"),
          _numberContainer("1"),
          _numberContainer("2"),
          _numberContainer("3"),
          _numberContainerIcon(Icons.backspace_outlined, operator: "delete"),
          _numberContainer("0"),
          _numberContainerIcon(Icons.question_mark, operator: "check"),
        ],
      ),
    );
  }

  Widget _numberContainer(String num, {String operator = "number"}) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          updateDisplay(num, operator: operator);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(0xFFFFD1E3),
        ),
        child: Text(
          num,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _numberContainerIcon(IconData icon, {String operator = "number"}) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          updateDisplay("", operator: operator);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(0xFFFFD1E3),
        ),
        child: Icon(
          icon,
          size: 32,
        ),
      ),
    );
  }

  void updateDisplay(String numVal, {String operator = "number"}) {
    String tempNum = number;
    setState(() {
      if (operator == "number") {
        if (tempNum.length == 1 && tempNum == "0") {
          tempNum = numVal;
        } else {
          tempNum += numVal;
        }
      } else {
        switch (operator) {
          case "delete":
            if (tempNum.length == 1) {
              tempNum = "0";
            } else {
              tempNum = tempNum.substring(0, tempNum.length - 1);
            }
            break;
          case "check":
            if(int.parse(tempNum) % 2 == 0){
              checkResult = "EVEN";
            }
            else{
              checkResult = "ODD";
            }
        }
      }
      number = tempNum;
    });
  }
}
