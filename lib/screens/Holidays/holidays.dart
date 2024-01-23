import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Holidays/holiday_card.dart';

class HolidayPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HolidayPage({super.key, required this.scaffoldKey});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  List<Map<String, dynamic>> data = [
    {'date': "22 January 2024", "day": "Monday", "event": "Ram Mandir Opening"},
    {'date': "26 January 2024", "day": "Friday", "event": "Republic Day"},
    {'date': "15 August 2024", "day": "Monday", "event": "Independence Day"},
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
                const Text(
                  'Holiday List',
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
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: HolidayCard(data: data[index]),
            );
          },
        ));
  }
}
