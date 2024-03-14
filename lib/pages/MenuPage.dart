import 'package:flutter/material.dart';
import 'package:tpmtugas2/assets/color/colorPalette.dart';
import 'package:tpmtugas2/pages/CalculatorPage.dart';
import 'package:tpmtugas2/pages/OddEvenPage.dart';

class MenuPage extends StatelessWidget {
  final String username;

  const MenuPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.primaryColor,
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
            style: TextStyle(color: ColorPallete.thirdColor, fontSize: 32),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.logout_sharp,
              size: 30,
              color: ColorPallete.thirdColor,
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
          margin: EdgeInsets.only(top: 100, right: 5),
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
              backgroundColor: ColorPallete.fourthColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calculate,
                  size: 40,
                  color: ColorPallete.thirdColor,
                ),
                Text(
                  "CALCULATOR",
                  style:
                      TextStyle(fontSize: 32, color: ColorPallete.thirdColor),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, right: 5),
          width: 400,
          height: 200,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OddEvenPage()));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: ColorPallete.fourthColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.question_mark,
                  size: 40,
                  color: ColorPallete.thirdColor,
                ),
                Text(
                  "ODD/EVEN",
                  style:
                      TextStyle(fontSize: 32, color: ColorPallete.thirdColor),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 120,
          margin: EdgeInsets.only(top: 40),
          color: ColorPallete.secondaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _nameCard("Faisal", "123210013"),
                  _nameCard("Raynald", "123210092"),
                  _nameCard("Dito", "123210142")
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _nameCard(String nama, String nim) {
    return Text(
      "$nama / $nim",
      style: TextStyle(fontSize: 16),
    );
  }
}
