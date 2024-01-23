import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Lesson%20Learnt/add_lesson.dart';
import 'package:techfinix/screens/Lesson%20Learnt/lesson_card.dart';

class LessonsListPage extends StatefulWidget {
  const LessonsListPage({super.key});

  @override
  State<LessonsListPage> createState() => _LessonsListPageState();
}

class _LessonsListPageState extends State<LessonsListPage> {
  List<Map<String, dynamic>> lessonsList = [
    {
      "lesson_title": "Lesson 1",
    },
    {
      "lesson_title": "Lesson 2",
    },
    {
      "lesson_title": "Lesson 3",
    },
    {
      "lesson_title": "Lesson 4",
    },
    {
      "lesson_title": "Lesson 5",
    },
    {
      "lesson_title": "Lesson 6",
    },
    {
      "lesson_title": "Lesson 7",
    },
    {
      "lesson_title": "Lesson 8",
    },
    {
      "lesson_title": "Lesson 9",
    },
    {
      "lesson_title": "Lesson 10",
    },
    {
      "lesson_title": "Lesson 11",
    },
  ];

  List<Map<String, dynamic>> get filteredList {
    final String searchText = _searchController.text.toLowerCase();
    final List<Map<String, dynamic>> searchList = lessonsList;

    return searchList
        .where(
            (data) => data['lesson_title'].toLowerCase().contains(searchText))
        .toList();
  }

  final TextEditingController _searchController = TextEditingController();
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
                'Lessons',
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
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Center(
                      child: Container(
                        width: 220,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(color: grey1),

                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            // error: SizedBox.shrink(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.search_rounded,
                              color: grey1,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddLessonPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color1,
                        padding: const EdgeInsets.all(0),
                        minimumSize: const Size(75, 40),
                        maximumSize: const Size(75, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredList.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 13),
                      child: LessonsCard(data: filteredList[i]),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
