import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Login/reset_password.dart';

class PinEnterPage extends StatefulWidget {
  const PinEnterPage({super.key});

  @override
  State<PinEnterPage> createState() => _PinEnterPageState();
}

class _PinEnterPageState extends State<PinEnterPage> {
  TextEditingController pinController = TextEditingController();

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
                  "Verify your email",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Please enter the code we sent to email',
                  maxLines: 1,
                  // overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "capjitesh123@gmail.com",
                  maxLines: 1,
                  // overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 12, color: color1, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                Pinput(
                  length: 5,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: const Color(0xFFE2E2E2), width: 1),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: const Color(0xFFE2E2E2), width: 1),
                    ),
                  ),
                  onCompleted: (pin) {
                    setState(() {
                      print(pin);
                      pinController.text = pin;
                    });
                  },
                  validator: (pin) {
                    if (pin!.length != 5) {
                      return "Enter a valid pin";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Didn't receive the OTP?",
                  maxLines: 1,
                  // overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color3,
                      minimumSize: const Size(60, 30),
                      maximumSize: const Size(60, 30),
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Text(
                    "Resend",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14,
                        color: color1,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordPage()),
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
                    "Verify",
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
