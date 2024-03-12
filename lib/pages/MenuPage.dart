import 'package:flutter/material.dart';
import 'package:tpmtugas2/pages/CalculatorPage.dart';
import 'package:tpmtugas2/pages/OddEvenPage.dart';

class MenuPage extends StatelessWidget {
  final String username;

  const MenuPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF392467),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              _topBar(context),
              _menuCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome,\n$username",
            style: TextStyle(color: Color(0xFFA367B1), fontSize: 32),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.logout_sharp,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(top: 100),
          width: 400,
          height: 200,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculatorPage()));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color(0xFFFFD1E3),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calculate,
                  size: 40,
                ),
                Text(
                  "CALCULATOR",
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          width: 400,
          height: 200,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OddEvenPage()));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color(0xFFFFD1E3),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.question_mark,
                  size: 40,
                ),
                Text(
                  "ODD/EVEN",
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
