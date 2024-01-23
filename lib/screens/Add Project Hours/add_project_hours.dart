import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Bottom%20Nav%20Bar/bottom_nav_bar.dart';
import 'package:techfinix/widgets/textfield.dart';

class AddProjectHours extends StatefulWidget {
 

  const AddProjectHours({super.key});

  @override
  State<AddProjectHours> createState() => _AddProjectHoursState();
}

class _AddProjectHoursState extends State<AddProjectHours> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController summaryController = TextEditingController();

  List<String> projectList = [
    'Coastal Roads',
    'Linking Road',
    'Ulhasnagar Roads',
    'Expressway road'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(),
                    ),
                    (route) => false,
                  );
                },
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 31,
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     print('tapped');
              //     widget.scaffoldKey.currentState?.openDrawer();
              //   },
              //   padding: const EdgeInsets.all(0),
              //   icon: SvgPicture.asset(
              //     "assets/drawer.svg",
              //     colorFilter:
              //         const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              //     width: 17,
              //     height: 19,
              //   ),
              // ),
              const SizedBox(width: 5),
              const Text(
                'Add Project Hours',
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
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                DropdownMenu<String>(
                  width: MediaQuery.of(context).size.width * 0.86,

                  initialSelection: projectList.first,
                  textStyle: const TextStyle(fontSize: 14),
                  label: Text(
                    "Project",
                    style: TextStyle(color: grey1),
                  ),
                  trailingIcon: Icon(
                    CupertinoIcons.chevron_down,
                    color: grey1,
                  ),
                  selectedTrailingIcon: Icon(
                    CupertinoIcons.chevron_up,
                    color: color1,
                  ),
                  menuStyle: const MenuStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: grey1),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey1),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey1),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  onSelected: (String? value) {
                    setState(() {
                      projectNameController.text = value!;
                    });
                  },
                  controller: projectNameController,
                  // underline: SizedBox.shrink(),
                  dropdownMenuEntries: projectList
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextBox(
                  controller: dateController,
                  hinttext: "Date",
                  readOnly: true,
                  icon: Icons.calendar_month_outlined,
                  label: "",
                  obscureText: false,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1999),
                            lastDate: DateTime(2025))
                        .then((value) {
                      setState(() {
                        dateController.text =
                            value!.toLocal().toString().split(' ')[0];
                      });
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextBox(
                  controller: hoursController,
                  hinttext: "Hours",
                  label: "",
                  obscureText: false,
                  icon: Icons.timelapse_rounded,
                  isNumber: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextBox(
                  controller: summaryController,
                  hinttext: "Summary",
                  label: "",
                  obscureText: false,
                  height: 215,
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color1,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
