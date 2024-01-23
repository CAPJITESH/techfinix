import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Daily%20Timeline/daily_timeline_card.dart';

class DailyTimelinePage extends StatefulWidget {
  const DailyTimelinePage({super.key});

  @override
  State<DailyTimelinePage> createState() => _DailyTimelinePageState();
}

class _DailyTimelinePageState extends State<DailyTimelinePage> {
  List<Map<String, dynamic>> data = [
    {
      "date": "Today",
      "timeline": [
        {
          "project_name": "Coastal Road",
          "time_worked": 5,
        },
        {
          "project_name": "Linking Road",
          "time_worked": 2,
        },
        {
          "project_name": "Expressway Road",
          "time_worked": 1,
        },
      ]
    },
    {
      "date": "20 Jan 2024",
      "timeline": [
        {
          "project_name": "Coastal Road",
          "time_worked": 8,
        },
      ]
    },
    {
      "date": "19 Jan 2024",
      "timeline": [
        {
          "project_name": "Coastal Road",
          "time_worked": 5,
        },
        {
          "project_name": "Linking Road",
          "time_worked": 2,
        },
      ]
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
                'Daily Timeline',
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
        child: ListView.builder(
          itemCount: data.length,
          padding: const EdgeInsets.all(24),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: index == data.length - 1
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.only(bottom: 8),
              child: DailyTimelineCard(data: data[index]),
            );
          },
        ),
      ),
    );
  }
}
