import 'package:flutter/material.dart';
import 'package:techfinix/constants.dart';

class LeavesDetailCard extends StatefulWidget {
  final Map<String, dynamic> data;
  const LeavesDetailCard({super.key, required this.data});

  @override
  State<LeavesDetailCard> createState() => _LeavesDetailCardState();
}

class _LeavesDetailCardState extends State<LeavesDetailCard> {
  @override
  void initState() {
    // TODO: implement initState
    assignColor();
    super.initState();
  }

  Color mainColor = green1.withOpacity(0.7);
  Color secColor = green2;
  void assignColor() {
    if (widget.data['status'] == "Rejected") {
      mainColor = red2;
      secColor = red3.withOpacity(0.7);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.data['dates'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 28,
                width: 72,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: secColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.data["status"],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: grey1.withOpacity(0.3),
              height: 0.5,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  "Apply Days",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: grey2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 110,
                child: Text(
                  "Balance Leaves",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: grey2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SizedBox(
                  width: 90,
                  child: Text(
                    "Leave Type",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: grey2,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  "${widget.data['apply_days']} Days",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 70,
                child: Text(
                  "${widget.data['balance_leaves']} Days",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  width: 100,
                  child: Text(
                    widget.data['leave_type'],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
