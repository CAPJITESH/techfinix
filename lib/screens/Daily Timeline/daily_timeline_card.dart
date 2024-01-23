import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';

class DailyTimelineCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const DailyTimelineCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data['date'],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data['timeline'].length,
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(
                  left: 20, right: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['timeline'][index]["project_name"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            data['date'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: grey1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 0.6,
                    color: grey1,
                  ),
                  Container(
                    width: 15,
                  ),
                  Container(
                    width: 45,
                    // padding: const EdgeInsets.only(top: 5, bottom: 5),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${data['timeline'][index]['time_worked']}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "hours",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
