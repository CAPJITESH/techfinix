import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Bottom%20Nav%20Bar/bottom_nav_bar.dart';
import 'package:techfinix/widgets/textfield.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfPasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
            child: Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.only(left: 10),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: grey1, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // const SizedBox(
                //   height: 10,
                // ),
                const Text(
                  "Enter New Password",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                const Text(
                  'Enter new password and confirm',
                  maxLines: 1,
                  // overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),

                TextBox(
                  controller: passwordController,
                  label: "",
                  hinttext: "Password",
                  isPassword: true,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextBox(
                  controller: cnfPasswordcontroller,
                  label: "",
                  hinttext: "Confirm Password",
                  isPassword: true,
                  obscureText: true,
                ),

                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
