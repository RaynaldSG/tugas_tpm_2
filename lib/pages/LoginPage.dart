import 'package:flutter/material.dart';
import 'package:tpmtugas2/assets/color/colorPalette.dart';
import 'package:tpmtugas2/pages/MenuPage.dart';

final userController = TextEditingController();
final passController = TextEditingController();

final List<String> authUsername = ["raynald", "faisal", "dito"];
final List<String> authPassword = ["123210092", "123210013", "123210141"];

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( //menggunakan container sebelum scaffold untuk memberikan background gradien
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: AlignmentDirectional.bottomEnd,
          colors: [ColorPallete.fourthColor, ColorPallete.primaryColor],
          //colors: [Color(0xFF9DB2BF), Color(0xFF27374D)],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent, //scaffold transparent agar tidak overwrite bg container
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 32,
                    color: ColorPallete.thirdColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                FormField(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _inputField(
                  "Username", userController, false, Icon(Icons.person)),
            ),
            _inputField("Password", passController, true, Icon(Icons.lock)),
            _inputButton(context),
          ],
        ));
  }

  Widget _inputField(
      String hint, TextEditingController controller, bool isPass, Icon icon) {
    return TextFormField(
      obscureText: isPass,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white, style: BorderStyle.solid),
        ),
        prefixIcon: icon,
        filled: true,
      ),
    );
  }

  Widget _inputButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          if (authUsername.contains(userController.text) && passController.text ==
              authPassword[authUsername.indexOf(userController.text)]) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage(username: userController.text)));
          } else {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  "Login Failed",
                  textAlign: TextAlign.center,
                ),
                content: const Text(
                  "Username or Password incorrect",
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context), //pop alert dialog
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        child: Text("Login"),
      ),
    );
  }
}
