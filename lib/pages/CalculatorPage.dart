import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double numberDouble = 0;
  double resultDouble = 0;
  int numberInt = 0;
  int resultInt = 0;
  String numberStr1 = "0";
  String numberStr2 = "";
  String numberStr = "0";
  String numberHistory = "";
  String mode = "int";
  String tempOperator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5D3587),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "CALCULATOR",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [_display(), _numPad()],
      ),
    );
  }

  Widget _display() {
    return Container(
      width: 500,
      height: 100,
      margin: EdgeInsets.only(top: 100),
      color: Color(0xFFA367B1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            numberHistory,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            numberStr,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget _numPad() {
    return Container(
      width: 400,
      height: 500,
      margin: EdgeInsets.only(top: 25),
      child: GridView.count(
        primary: false,
        crossAxisCount: 4,
        children: [
          _numberContainer("C", operator: "clear"),
          _numberContainerIcon(Icons.backspace_outlined, operator: "delete"),
          _numberContainer("%", operator: "mod"),
          _numberContainer("/", operator: "div"),
          _numberContainer("7"),
          _numberContainer("8"),
          _numberContainer("9"),
          _numberContainerIcon(Icons.clear, operator: "multiply"),
          _numberContainer("4"),
          _numberContainer("5"),
          _numberContainer("6"),
          _numberContainer("-", operator: "sub"),
          _numberContainer("1"),
          _numberContainer("2"),
          _numberContainer("3"),
          _numberContainer("+", operator: "add"),
          _numberContainer("^", operator: "pow"),
          _numberContainer("0"),
          _numberContainer(".", operator: "decimal"),
          _numberContainer("=", operator: "equal"),
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
    String tempNum = "0";
    setState(() {
      if(numberStr1 == "Undefined"){
        numberStr1 = "0";
        numberStr = "0";
      }
    });

    if (tempOperator == "" &&
        (operator == "number" ||
            operator == "decimal" ||
            operator == "delete")) {
      tempNum = numberStr1;
    } else {
      tempNum = numberStr2;
    }

    switch (operator) {
      case "delete":
        if (numberStr2.isEmpty && tempOperator.isNotEmpty) {
          tempOperator = "";
          tempNum = numberStr1;
        } else if (numberStr.length == 1 || tempNum.isEmpty) {
          tempNum = "0";
          mode = "int";
        } else {
          tempNum = tempNum.substring(0, tempNum.length - 1);
        }
        break;
      case "clear":
        tempNum = "0";
        numberStr1 = "0";
        numberStr2 = "";
        mode = "int";
        tempOperator = "";
        if (numberStr == "0") {
          numberHistory = "";
        }
        break;
      case "decimal":
        if (tempNum.contains(".")) {
          break;
        }
        mode = "decimal";
        if(tempNum.isEmpty){
          tempNum += "0.";
        }
        else{
          tempNum += ".";
        }
        break;
      case "add":
        if (tempOperator == "") {
          tempOperator = "+";
        }
        break;
      case "sub":
        if (tempOperator == "") {
          tempOperator = "-";
        }
        break;
      case "multiply":
        if (tempOperator == "") {
          tempOperator = "*";
        }
        break;
      case "div":
        if (tempOperator == "") {
          tempOperator = "/";
        }
        break;
      case "mod":
        if (tempOperator == "") {
          tempOperator = "%";
        }
        break;
      case "pow":
        if (tempOperator == "") {
          tempOperator = "^";
        }
        break;
      case "equal":
        if (numberStr2.isEmpty) {
          tempNum = numberStr1;
          break;
        }
        if(numberStr2 == "0" && tempOperator == "/"){
          tempNum = "Undefined";
          numberHistory = "Undefined";
          tempOperator = "";
          numberStr2 = "";
          numberStr1 = tempNum;
          break;
        }
        if (!numberStr.contains(".")) {
          calcInt();
          tempNum = resultInt.toString();
          if (tempOperator == "/") {
            if(int.parse(numberStr1) % int.parse(numberStr2) == 0){
              tempNum = resultDouble.toInt().toString();
            }
            else{
              tempNum = resultDouble.toString();
            }
          }
          numberHistory = numberStr;
          tempOperator = "";
          numberStr2 = "";
          numberStr1 = tempNum;
        } else {
          calcDouble();
          numberHistory = numberStr;
          tempOperator = "";
          tempNum = resultDouble.toString();
          numberStr1 = tempNum;
          numberStr2 = "";
        }
      default:
        break;
    }

    if (operator == "number") {
      // if (mode == "int") {
      //   numberInt = int.parse(tempNum);
      //   if (numberInt == 0) {
      //     tempNum = numVal;
      //   } else {
      //     tempNum += numVal;
      //   }
      // } else {
      if (tempNum.length == 1 && numberStr == "0") {
        tempNum = numVal;
      } else {
        tempNum += numVal;
      }
      // }
    }

    setState(() {
      if (tempOperator == "") {
        numberStr1 = tempNum;
        numberStr = numberStr1;
      } else {
        if (numberStr2 == "") {
          numberStr2 = tempNum;
          numberStr = numberStr1 + tempOperator + numberStr2;
        } else {
          numberStr2 = tempNum;
          numberStr = numberStr1 + tempOperator + numberStr2;
        }
      }
    });
  }

  void calcInt() {
    int num1 = int.parse(numberStr1);
    int num2 = int.parse(numberStr2);

    switch (tempOperator) {
      case "+":
        resultInt = num1 + num2;
        break;
      case "-":
        resultInt = num1 - num2;
        break;
      case "*":
        resultInt = num1 * num2;
        break;
      case "/":
        resultDouble = num1 / num2;
        break;
      case "%":
        resultInt = num1 % num2;
        break;
      case "^":
        num result = pow(num1, num2);
        resultInt = result.toInt();
        break;
      default:
        break;
    }
  }

  void calcDouble() {
    double num1 = double.parse(numberStr1);
    double num2 = double.parse(numberStr2);

    switch (tempOperator) {
      case "+":
        resultDouble = num1 + num2;
        break;
      case "-":
        resultDouble = num1 - num2;
        break;
      case "*":
        resultDouble = num1 * num2;
        break;
      case "/":
        resultDouble = num1 / num2;
        break;
      case "%":
        resultDouble = num1 % num2;
        break;
      case "^":
        num result = pow(num1, num2);
        resultDouble = result.toDouble();
        break;
      default:
        break;
    }
  }
}
