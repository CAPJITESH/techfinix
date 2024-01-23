import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techfinix/constants.dart';

class MonthlyAttendance extends StatefulWidget {
  const MonthlyAttendance({super.key});

  @override
  State<MonthlyAttendance> createState() => _MonthlyAttendanceState();
}

class _MonthlyAttendanceState extends State<MonthlyAttendance> {
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  List<Map<String, dynamic>> data = [
    {
      "date": DateTime(2024, 1, 1, 9, 38),
      "clock_out": DateTime(2024, 1, 1, 19, 0)
    },
    {
      "date": DateTime(2024, 1, 2, 9, 30),
      "clock_out": DateTime(2024, 1, 2, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 3, 9, 47),
      "clock_out": DateTime(2024, 1, 3, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 4, 9, 30),
      "clock_out": DateTime(2024, 1, 4, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 5, 9, 30),
      "clock_out": DateTime(2024, 1, 5, 18, 30)
    },
    {
      "date": DateTime(2024, 1, 6, 9, 53),
      "clock_out": DateTime(2024, 1, 6, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 7, 9, 30),
      "clock_out": DateTime(2024, 1, 7, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 8, 9, 30),
      "clock_out": DateTime(2024, 1, 8, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 9, 10, 0),
      "clock_out": DateTime(2024, 1, 9, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 10, 9, 30),
      "clock_out": DateTime(2024, 1, 10, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 11, 9, 30),
      "clock_out": DateTime(2024, 1, 11, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 12, 9, 30),
      "clock_out": DateTime(2024, 1, 12, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 13, 11, 20),
      "clock_out": DateTime(2024, 1, 13, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 14, 9, 30),
      "clock_out": DateTime(2024, 1, 14, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 15, 9, 30),
      "clock_out": DateTime(2024, 1, 15, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 16, 9, 30),
      "clock_out": DateTime(2024, 1, 16, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 17, 9, 30),
      "clock_out": DateTime(2024, 1, 17, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 18, 9, 30),
      "clock_out": DateTime(2024, 1, 18, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 19, 9, 30),
      "clock_out": DateTime(2024, 1, 19, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 20, 9, 30),
      "clock_out": DateTime(2024, 1, 20, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 21, 9, 30),
      "clock_out": DateTime(2024, 1, 21, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 22, 9, 30),
      "clock_out": DateTime(2024, 1, 22, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 23, 9, 30),
      "clock_out": DateTime(2024, 1, 23, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 24, 9, 30),
      "clock_out": DateTime(2024, 1, 24, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 25, 9, 30),
      "clock_out": DateTime(2024, 1, 25, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 26, 9, 30),
      "clock_out": DateTime(2024, 1, 26, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 27, 9, 30),
      "clock_out": DateTime(2024, 1, 27, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 28, 9, 30),
      "clock_out": DateTime(2024, 1, 28, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 29, 9, 30),
      "clock_out": DateTime(2024, 1, 29, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 30, 9, 30),
      "clock_out": DateTime(2024, 1, 30, 19, 10)
    },
    {
      "date": DateTime(2024, 1, 31, 9, 30),
      "clock_out": DateTime(2024, 1, 31, 19, 10)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: Container(
          height: 105,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 31,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Attendance',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
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
              const SizedBox(
                width: 5,
              )
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
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: DropdownDatePicker(
                      icon: const Icon(
                        CupertinoIcons.chevron_down,
                        color: Colors.black,
                        size: 15,
                      ),
                      textStyle: TextStyle(
                          color: black2,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      inputDecoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        constraints:
                            BoxConstraints(maxHeight: 48, maxWidth: 120),
                      ),
                      isDropdownHideUnderline: true,
                      isFormValidator: true,
                      startYear: year - 5,
                      endYear: 2030,
                      width: 20,
                      showDay: false,
                      selectedMonth: month,
                      selectedYear: year,
                      yearFlex: 3,
                      monthFlex: 5,
                      onChangedMonth: (value) {
                        print('onChangedMonth: $value');
                        setState(() {
                          month = int.parse(value!);
                        });
                      },
                      onChangedYear: (value) {
                        print('onChangedYear: $value');
                        setState(() {
                          year = int.parse(value!);
                        });
                      },
                      boxDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              "Date",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              "Clocked In",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              "Clocked Out",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      for (int i = 0; i < data.length; i++)
                        rowElement(data[i], i == data.length - 1),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rowElement(Map<String, dynamic> data, bool noDivider) {
    DateTime clockInTime = data['date'];
    DateTime clockOutTime = data['clock_out'];

    TimeOfDay clockInTimeOfDay = TimeOfDay.fromDateTime(clockInTime);
    TimeOfDay clockOutTimeOfDay = TimeOfDay.fromDateTime(clockOutTime);

    int clockInMinutes = clockInTimeOfDay.hour * 60 + clockInTimeOfDay.minute;
    int clockOutMinutes =
        clockOutTimeOfDay.hour * 60 + clockOutTimeOfDay.minute;

    int lateClockInMinutes = 9 * 60 + 45; // 9:45 AM in minutes since midnight
    int earlyClockOutMinutes = 19 * 60; // 7:00 PM in minutes since midnight

    Color clockInColor = clockInMinutes > lateClockInMinutes ? red2 : green1;
    Color clockOutColor =
        clockOutMinutes < earlyClockOutMinutes ? red2 : green1;

    String clockInTimeStr = DateFormat.jm().format(
        DateTime(2024, 1, 1, clockInTimeOfDay.hour, clockInTimeOfDay.minute));
    String clockOutTimeStr = DateFormat.jm().format(
        DateTime(2024, 1, 1, clockOutTimeOfDay.hour, clockOutTimeOfDay.minute));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 90,
              child: Text(
                DateFormat('dd MMM yy').format(data['date']),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 90,
              child: Text(
                clockInTimeStr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: clockInColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 90,
              child: Text(
                clockOutTimeStr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: clockOutColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        if (noDivider == false)
          Divider(
            color: grey1.withOpacity(0.6),
            thickness: 0.6,
          ),
      ],
    );
  }
}
