import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techfinix/constants.dart';

class SingleVoucherCard extends StatefulWidget {
  const SingleVoucherCard({super.key});

  @override
  State<SingleVoucherCard> createState() => _SingleVoucherCardState();
}

class _SingleVoucherCardState extends State<SingleVoucherCard> {
  Map<String, dynamic> data = {
    "total": "₹ 5,000",
    "project_name": "EASTERN FREEWAY",
    "code": "#131313",
    "date": "22 Jan 2023",
    "expense": [
      {
        "type": "Travel",
        "cost": "₹ 1000",
      },
      {
        "type": "Medical",
        "cost": "₹ 1000",
      },
      {
        "type": "Food",
        "cost": "₹ 1000",
      },
      {
        "type": "Hotel",
        "cost": "₹ 2000",
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
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
                'Voucher',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    data['total'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data['project_name'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data['expense'].length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return dataRow(data['expense'][index]);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 45,
                      ),

                      Text(
                        data['code'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['date'],
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // const SizedBox(
                      //   height: 30,
                      // )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: color1,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 3,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: MediaQuery.of(context).size.width ~/ 7,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 3,
                              width: 7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: index % 2 == 0
                                    ? const Color(0xff666666).withOpacity(0.2)
                                    : Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 49,
                      decoration: BoxDecoration(
                        color: color1,
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget dataRow(Map<String, dynamic> d) {
    return Container(
      height: 35,
      padding: const EdgeInsets.only(
        left: 27,
        right: 27,
      ),
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              d['type'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 90,
            child: Text(
              d['cost'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color3,
              padding: const EdgeInsets.all(0),
              minimumSize: const Size(70, 23),
              maximumSize: const Size(70, 23),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/view_bill.svg",
                  colorFilter: ColorFilter.mode(color1, BlendMode.srcIn),
                  width: 10,
                  height: 10,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "View Bill",
                  style: TextStyle(
                    color: color1,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
