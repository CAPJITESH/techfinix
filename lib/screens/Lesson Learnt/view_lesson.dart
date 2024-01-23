import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';

class ViewLessonPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ViewLessonPage({super.key, required this.data});

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
              Text(
                data['lesson_title'],
                style: const TextStyle(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PROBLEM",
                  style: TextStyle(
                    color: color1,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "SOLUTION",
                  style: TextStyle(
                    color: color1,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Volutpat odio facilisis mauris sit amet massa vitae tortor. Ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt. Non sodales neque sodales ut etiam sit amet. Feugiat in fermentum posuere urna nec tincidunt praesent semper. Molestie nunc non blandit massa. Non pulvinar neque laoreet suspendisse interdum consectetur. Quis risus sed vulputate odio ut enim blandit volutpat. Ullamcorper eget nulla facilisi etiam dignissim. Iaculis nunc sed augue lacus viverra. Lectus sit amet est placerat in egestas. Vestibulum lorem sed risus ultricies tristique nulla aliquet enim tortor. Viverra vitae congue eu consequat ac felis donec et odio. Nec feugiat in fermentum posuere. Duis convallis convallis tellus id interdum velit laoreet id donec. Cursus mattis molestie a iaculis at. Nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum. Nulla porttitor massa id neque aliquam vestibulum. Malesuada bibendum arcu vitae elementum curabitur. Scelerisque felis imperdiet proin fermentum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Volutpat odio facilisis mauris sit amet massa vitae tortor. Ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt. Non sodales neque sodales ut etiam sit amet. Feugiat in fermentum posuere urna nec tincidunt praesent semper. Molestie nunc non blandit massa. Non pulvinar neque laoreet suspendisse interdum consectetur. Quis risus sed vulputate odio ut enim blandit volutpat. Ullamcorper eget nulla facilisi etiam dignissim. Iaculis nunc sed augue lacus viverra. Lectus sit amet est placerat in egestas. Vestibulum lorem sed risus ultricies tristique nulla aliquet enim tortor. Viverra vitae congue eu consequat ac felis donec et odio. Nec feugiat in fermentum posuere. Duis convallis convallis tellus id interdum velit laoreet id donec. Cursus mattis molestie a iaculis at. Nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum. Nulla porttitor massa id neque aliquam vestibulum. Malesuada bibendum arcu vitae elementum curabitur. Scelerisque felis imperdiet proin fermentum.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
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
