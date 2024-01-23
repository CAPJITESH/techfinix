import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Leaves/add_leaves.dart';
import 'package:techfinix/screens/Leaves/leaves_count_card.dart';
import 'package:techfinix/screens/Leaves/leaves_detail_card.dart';

class LeavesPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const LeavesPage({super.key, required this.scaffoldKey});

  @override
  State<LeavesPage> createState() => _LeavesPageState();
}

class _LeavesPageState extends State<LeavesPage> {
  final PanelController controller = PanelController();
  bool isPanelOpen = false;

  List<Map<String, dynamic>> leavesCount = [
    {"title": "Balance Leaves", "count": "20"},
    {"title": "Approved Leaves", "count": "3"},
    {"title": "Total Leaves", "count": "23"},
  ];

  List<Map<String, dynamic>> leaveDetails = [
    {
      "dates": "1 Apr 2024 - 3 Apr 2024",
      "status": "Approved",
      "apply_days": 3,
      "balance_leaves": 20,
      "leave_type": "Personal Leave"
    },
    {
      "dates": "4 Apr 2024 - 5 Apr 2024",
      "status": "Approved",
      "apply_days": 2,
      "balance_leaves": 18,
      "leave_type": "Medical Leave"
    },
    {
      "dates": "6 Apr 2024 - 8 Apr 2024",
      "status": "Rejected",
      "apply_days": 2,
      "balance_leaves": 16,
      "leave_type": "Personal Leave"
    },
    {
      "dates": "1 Apr 2024 - 3 Apr 2024",
      "status": "Approved",
      "apply_days": 3,
      "balance_leaves": 20,
      "leave_type": "Personal Leave"
    }
  ];

  void togglePanel() {
    setState(() {
      if (isPanelOpen) {
        controller.close();
        isPanelOpen = false;
      } else {
        controller.open();
        isPanelOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                'Leaves',
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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Row(
                      children: [
                        for (int i = 0; i < leavesCount.length; i++)
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: LeavesCountCard(data: leavesCount[i]),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: bg1,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              togglePanel();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color1,
                              minimumSize: const Size(90, 40),
                              maximumSize: const Size(90, 40),
                              padding: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/add_voucher.svg",
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                  width: 15,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "Create",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          itemCount: leaveDetails.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: LeavesDetailCard(
                                data: leaveDetails[index],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SlidingUpPanel(
              controller: controller,
              minHeight: 0.0,
              maxHeight: MediaQuery.of(context).size.height * 0.6,
              panelBuilder: (sc) {
                return AddLeaveSlidingPanel(
                  controller: controller,
                );
              },
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              // backdropTapClosesPanel: true,
              // isDraggable: false,
              backdropEnabled: true,
              backdropColor: Colors.black,
              backdropOpacity: 0.4,

              onPanelClosed: () {
                isPanelOpen = false;
              },
            )
          ],
        ),
      ),
    );
  }
}
