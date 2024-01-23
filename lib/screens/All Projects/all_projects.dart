import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Home/project_card.dart';

class AllProjectsPage extends StatefulWidget {
  const AllProjectsPage({super.key});

  @override
  State<AllProjectsPage> createState() => _AllProjectsPageState();
}

class _AllProjectsPageState extends State<AllProjectsPage> {
  @override
  Widget build(BuildContext context) {
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
      },
      {
        "project_name": "Eastern Freeway",
        "time_left": "Completed",
        "images": [
          'assets/employee.png',
          'assets/employee.png',
          'assets/employee.png',
        ],
        "progress": "100",
        "progress_status": "Completed",
      },
      {
        "project_name": "Eastern Expressway",
        "time_left": "50 Hrs Left",
        "images": [
          'assets/employee.png',
          'assets/employee.png',
        ],
        "progress": "80",
        "progress_status": "In Progress",
      },
    ];
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
            image: const DecorationImage(
              image: AssetImage('assets/app_bar.png'),
              fit: BoxFit.cover,
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
                'All Projects',
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
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),

        shrinkWrap: true,
        itemCount: projects.length,
        // physics: ,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 20),
            child: ProjectCardHome(data: projects[index]),
          );
        },
      ),
    );
  }
}
