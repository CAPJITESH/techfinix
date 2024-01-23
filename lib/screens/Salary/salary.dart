import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Salary/salary_card.dart';

class SalaryPage extends StatefulWidget {
  const SalaryPage({Key? key}) : super(key: key);

  @override
  State<SalaryPage> createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  int year = DateTime.now().year;

  List<Map<String, dynamic>> salaryData = [
    {
      "month": "January 2024",
      "total_gross_salary": "₹ 28,427",
      "net_take_home": "₹ 23,227"
    },
    {
      "month": "Feduary 2024",
      "total_gross_salary": "₹ 23,427",
      "net_take_home": "₹ 26,227"
    },
    {
      "month": "March 2024",
      "total_gross_salary": "₹ 128,427",
      "net_take_home": "₹ 123,227"
    },
    {
      "month": "April 2024",
      "total_gross_salary": "₹ 228,427",
      "net_take_home": "₹ 223,227"
    },
    {
      "month": "May 2024",
      "total_gross_salary": "₹ 427",
      "net_take_home": "₹ 227"
    },
    {
      "month": "June 2024",
      "total_gross_salary": "₹ 8,427",
      "net_take_home": "₹ 3,227"
    },
    {
      "month": "July 2024",
      "total_gross_salary": "₹ 188,427",
      "net_take_home": "₹ 173,227"
    },
    {
      "month": "August 2024",
      "total_gross_salary": "₹ 28,427",
      "net_take_home": "₹ 23,227"
    },
    {
      "month": "September 2024",
      "total_gross_salary": "₹ 28,427",
      "net_take_home": "₹ 23,227"
    },
    {
      "month": "October 2024",
      "total_gross_salary": "₹ 28,427",
      "net_take_home": "₹ 23,227"
    },
    {
      "month": "November 2024",
      "total_gross_salary": "₹ 28,427",
      "net_take_home": "₹ 23,227"
    },
    {
      "month": "December 2024",
      "total_gross_salary": "₹ 28,427",
      "net_take_home": "₹ 23,227"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
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
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 31,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Salary',
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButton(
                      value: year,
                      onChanged: (newValue) {
                        setState(() {
                          year = newValue!;
                        });
                      },
                      icon: const Icon(
                        CupertinoIcons.chevron_down,
                        size: 18,
                      ),
                      items: [
                        for (int i = year; i >= year - 10; i--)
                          DropdownMenuItem(
                            child: Text("$i"),
                            value: i,
                          )
                      ],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: salaryData.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: SalaryCard(data: salaryData[index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
