import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Lesson%20Learnt/view_lesson.dart';

class LessonsCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const LessonsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewLessonPage(data: data),
          ),
        );
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: grey3, borderRadius: BorderRadius.circular(5)),
              child: SvgPicture.asset(
                "assets/note.svg",
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                width: 15,
                height: 15,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              data['lesson_title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              height: 36,
              width: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color3,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                CupertinoIcons.chevron_forward,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
