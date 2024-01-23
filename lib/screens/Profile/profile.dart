import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/img_helper.dart';
import 'package:techfinix/widgets/drawer.dart';
import 'package:techfinix/widgets/textfield.dart';

class ProfilePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProfilePage({super.key, required this.scaffoldKey});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImageHelper _imageHelper = ImageHelper();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: Container(
          height: 105,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            image: const DecorationImage(
              image: AssetImage("assets/app_bar.png"),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.only(top: 28, bottom: 8),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    print('tapped');
                    widget.scaffoldKey.currentState?.openDrawer();
                  },
                  padding: const EdgeInsets.all(0),
                  icon: SvgPicture.asset(
                    "assets/drawer.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 17,
                    height: 19,
                  ),
                );
              }),
              const SizedBox(width: 5),
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  print('tapped');
                  // Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  height: 20,
                  constraints: const BoxConstraints(
                    minHeight: 20,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final file = await _imageHelper.getImage();
                    if (file != null) {
                      final cropped =
                          await _imageHelper.crop(file, CropStyle.rectangle);
                      if (cropped != null) {
                        setState(() {
                          _image = cropped;
                        });
                      }
                    }
                  },
                  child: Stack(
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: CircleAvatar(
                            backgroundColor: color1,
                            radius: 43,
                            foregroundImage:
                                _image != null ? FileImage(_image!) : null,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 60,
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 28,
                          width: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: black2,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  constraints: const BoxConstraints(
                    minHeight: 20,
                  ),
                ),
                TextBox(
                  obscureText: false,
                  label: "",
                  hinttext: "Employee ID",
                  value: "JG1234",
                  readOnly: true,
                ),
                Container(
                  height: 15,
                  constraints: const BoxConstraints(
                    minHeight: 15,
                  ),
                ),
                TextBox(
                  obscureText: false,
                  label: "",
                  hinttext: "Full Name",
                  value: "Jitesh Gogia",
                  readOnly: true,
                ),
                Container(
                  height: 15,
                  constraints: const BoxConstraints(
                    minHeight: 15,
                  ),
                ),
                TextBox(
                  obscureText: false,
                  label: "",
                  hinttext: "Phone Number",
                  value: "+91 8380004440",
                  readOnly: true,
                ),
                Container(
                  height: 15,
                  constraints: const BoxConstraints(
                    minHeight: 15,
                  ),
                ),
                TextBox(
                  obscureText: false,
                  label: "",
                  hinttext: "Designation",
                  value: "Manager",
                  readOnly: true,
                ),
                Container(
                  height: 15,
                  constraints: const BoxConstraints(
                    minHeight: 15,
                  ),
                ),
                TextBox(
                  obscureText: false,
                  label: "",
                  hinttext: "Blood Group",
                  value: "O+",
                  readOnly: true,
                ),
                Container(
                  height: 15,
                  constraints: const BoxConstraints(
                    minHeight: 15,
                  ),
                ),
                // Container(
                //   height: 45,
                //   width: double.infinity,
                //   constraints: const BoxConstraints(minHeight: 45),
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //         backgroundColor: color1,
                //         fixedSize: const Size(double.infinity, 45)),
                //     child: Text(
                //       "Update",
                //       style: GoogleFonts.inter(
                //         fontSize: 16,
                //         fontWeight: FontWeight.w700,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
