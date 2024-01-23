import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';

class HolidayCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const HolidayCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 80,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 15, 22, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_sharp,
                            size: 15,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            data['date'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['event'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  Text(
                    data['day'],
                    style: TextStyle(
                      color: grey1,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
