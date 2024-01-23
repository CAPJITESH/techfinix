import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/widgets/textfield.dart';

class AddLeaveSlidingPanel extends StatefulWidget {
  final PanelController controller;
  const AddLeaveSlidingPanel({super.key, required this.controller});

  @override
  State<AddLeaveSlidingPanel> createState() => _AddLeaveSlidingPanelState();
}

class _AddLeaveSlidingPanelState extends State<AddLeaveSlidingPanel> {
  final TextEditingController leaveType = TextEditingController();

  final TextEditingController startDate = TextEditingController();

  final TextEditingController endDate = TextEditingController();

  final TextEditingController reason = TextEditingController();

  final List<String> leaveTypeList = [
    "Medical Leave",
    "Personal Leave",
    "Casual Leave",
    "Annual Leave"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 80,
            decoration: BoxDecoration(
              color: grey1.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          DropdownMenu<String>(
            width: MediaQuery.of(context).size.width * 0.89,

            initialSelection: leaveTypeList.first,
            textStyle: const TextStyle(fontSize: 14),
            label: Text(
              "Leave Type",
              style: TextStyle(color: grey1),
            ),
            trailingIcon: Icon(
              CupertinoIcons.chevron_down,
              color: grey1,
            ),
            selectedTrailingIcon: Icon(
              CupertinoIcons.chevron_up,
              color: grey1,
            ),
            menuStyle: const MenuStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white)),
            inputDecorationTheme: InputDecorationTheme(
              constraints: const BoxConstraints(maxHeight: 50),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: grey1),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: grey1),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),

            onSelected: (String? value) {
              setState(() {
                leaveType.text = value!;
              });
            },
            controller: leaveType,
            // underline: SizedBox.shrink(),
            dropdownMenuEntries:
                leaveTypeList.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(
                value: value,
                label: value,
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          TextBox(
            controller: startDate,
            hinttext: "Start Date",
            readOnly: true,
            icon: Icons.calendar_month_outlined,
            label: "",
            obscureText: false,
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2025))
                  .then((value) {
                setState(() {
                  startDate.text = value!.toLocal().toString().split(' ')[0];
                });
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextBox(
            controller: endDate,
            hinttext: "End Date",
            readOnly: true,
            label: "",
            obscureText: false,
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2025))
                  .then((value) {
                setState(() {
                  endDate.text = value!.toLocal().toString().split(' ')[0];
                });
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextBox(
            controller: reason,
            height: 120,
            maxLines: 3,
            hinttext: "Reason for Leave",
            label: "",
            obscureText: false,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              widget.controller.close();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: color1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: const Size(double.infinity, 45),
            ),
            child: const Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
