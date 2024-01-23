import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/All%20Projects/all_projects.dart';
import 'package:techfinix/screens/Home/attendance_card.dart';
import 'package:techfinix/screens/Home/project_card.dart';
import 'package:techfinix/screens/Monthly%20Attendance/monthly_attendace.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomePage({super.key, required this.scaffoldKey});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedValue = "Today";

  List<Map<String, dynamic>> attendanceCard = [
    {
      "context": "Clock In",
      "time": "9:46 AM",
      "remark": "Clocked in Late",
      "isLate": "yes"
    },
    {
      "context": "Clock Out",
      "time": "6:35 PM",
      "remark": "On Time",
      "onTime": "yes"
    },
    {
      "context": "Total Hours",
      "time": "9 Hours",
      "remark": "Working Hours",
    },
    {
      "context": "Total Days",
      "time": "25 Days",
      "remark": "Working Days",
    }
  ];

  List<Map<String, dynamic>> projects = [
    {
      "project_name": "Bandra Worli Sea link",
      "time_left": "23 Hrs Left",
      "images": [
        'assets/employee.png',
        'assets/employee.png',
        'assets/employee.png',
        'assets/employee.png',
      ],
      "progress": "70",
      "progress_status": "In Progress",
    },
    {
      "project_name": "Linking Road",
      "time_left": "Completed",
      "images": [
        'assets/employee.png',
        'assets/employee.png',
      ],
      "progress": "100",
      "progress_status": "Completed",
    },
    {
      "project_name": "Coastal Road",
      "time_left": "10 Hrs Exceed",
      "images": [
        'assets/employee.png',
        'assets/employee.png',
        'assets/employee.png',
        'assets/employee.png',
        'assets/employee.png',
        'assets/employee.png',
      ],
      "progress": "100",
      "progress_status": "Overtime",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 105),
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
              )),
          padding: const EdgeInsets.only(top: 28),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
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
              ),
              const SizedBox(
                width: 5,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Jitesh Gogia',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  print('tapped');
                  // Scaffold.of(context).openDrawer();
                },
                // padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 105,
            //   decoration: BoxDecoration(
            //     color: color1,
            //     borderRadius: const BorderRadius.only(
            //       bottomLeft: Radius.circular(25),
            //       bottomRight: Radius.circular(25),
            //     ),
            //   ),
            //   padding: const EdgeInsets.only(top: 20),
            //   alignment: Alignment.bottomCenter,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           print('tapped');
            //           // Scaffold.of(context).openDrawer();
            //         },
            //         padding: const EdgeInsets.all(0),
            //         icon: SvgPicture.asset(
            //           "assets/drawer.svg",
            //           colorFilter:
            //               const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            //           width: 17,
            //           height: 19,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 5,
            //       ),
            //       const Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Welcome',
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w400),
            //           ),
            //           Text(
            //             'Jitesh Gogia',
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w700),
            //           ),
            //         ],
            //       ),
            //       const Spacer(),
            //       IconButton(
            //         onPressed: () {
            //           print('tapped');
            //           // Scaffold.of(context).openDrawer();
            //         },
            //         // padding: const EdgeInsets.all(0),
            //         icon: const Icon(
            //           Icons.notifications_none_rounded,
            //           color: Colors.white,
            //           size: 28,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 5,
            //       )
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              headerProps: const EasyHeaderProps(
                // showHeader: false,
                monthPickerType: MonthPickerType.dropDown,
                dateFormatter: DateFormatter.fullDateDMY(),
              ),
              dayProps: EasyDayProps(
                width: 64,
                height: 80,
                dayStructure: DayStructure.dayStrDayNum,
                todayStyle: DayStyle(
                  dayNumStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  dayStrStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: color3,
                    border: Border.all(color: color1, width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                activeDayStyle: DayStyle(
                  dayNumStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  dayStrStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                inactiveDayStyle: DayStyle(
                  dayNumStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  dayStrStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: color3,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: bg1,
              ),
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today's Attendance",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        height: 26,
                        width: 72,
                        padding: const EdgeInsets.only(left: 5, right: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.5),
                          color: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: const Icon(
                              CupertinoIcons.chevron_down,
                            ),
                            iconSize: 18,
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                                if (newValue == "Monthly ") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MonthlyAttendance(),
                                    ),
                                  );
                                }
                              });
                            },
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: black2,
                            ),
                            items: <String>[
                              "Today",
                              'Monthly ',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                  width: 45,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: black2,
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 139 / 90,
                    ),
                    itemCount: attendanceCard.length,
                    itemBuilder: (context, index) {
                      return AttendanceCardHome(data: attendanceCard[index]);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Projects",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AllProjectsPage(),
                            ),
                          );
                        },
                        icon: Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: color1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: projects.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: ProjectCardHome(data: projects[index]),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
