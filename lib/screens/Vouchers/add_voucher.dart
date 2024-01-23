import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/img_helper.dart';
import 'package:techfinix/widgets/textfield.dart';

class AddVoucherPage extends StatefulWidget {
  const AddVoucherPage({super.key});

  @override
  State<AddVoucherPage> createState() => _AddVoucherPageState();
}

class _AddVoucherPageState extends State<AddVoucherPage> {
  TextEditingController voucherNo = TextEditingController();
  TextEditingController voucherDate = TextEditingController();
  TextEditingController projectName = TextEditingController();

  List<TextEditingController> expenseControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> amountControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> projectList = [
    "Eastern Expressway",
    "Western Expressway",
    "Ulhasnagar Expressway",
    "Coastal Beach"
  ];

  List<String> expenseType = ["Travel", "Hotel", "Medical"];

  int expenseCount = 3;
  final ImageHelper _imageHelper = ImageHelper();

  List<File?> images = [
    null,
    null,
    null,
  ];

  void addExpense() {
    setState(() {
      expenseCount = expenseCount + 1;
      expenseControllers.add(TextEditingController());
      amountControllers.add(TextEditingController());
      images.add(null);
    });
  }

  void removeExpense() {
    if (expenseCount > 1) {
      setState(() {
        expenseCount -= 1;
        expenseControllers.removeLast();
        amountControllers.removeLast();
        images.removeLast();
      });
    }
  }

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
              const Text(
                'Create Voucher',
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextBox(
                // controller: voucherNo,
                hinttext: "Voucher Number",
                value: "#151651",
                label: "",
                obscureText: false,
                readOnly: true,
              ),
              const SizedBox(
                height: 15,
              ),
              TextBox(
                controller: voucherDate,
                hinttext: "Voucher Date",
                readOnly: true,
                label: "",
                icon: Icons.calendar_month_outlined,
                obscureText: false,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1999),
                          lastDate: DateTime(2025))
                      .then((value) {
                    setState(
                      () {
                        voucherDate.text =
                            value!.toLocal().toString().split(' ')[0];
                      },
                    );
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownMenu<String>(
                width: MediaQuery.of(context).size.width * 0.89,

                initialSelection: projectList.first,
                textStyle: const TextStyle(fontSize: 14),
                label: Text(
                  "Project Name",
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
                    projectName.text = value!;
                  });
                },
                controller: projectName,
                // underline: SizedBox.shrink(),
                dropdownMenuEntries:
                    projectList.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < expenseCount; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // s
                    children: [
                      DropdownMenu<String>(
                        width: 125,

                        initialSelection: expenseType.first,
                        textStyle: const TextStyle(
                            fontSize: 12, overflow: TextOverflow.clip),
                        label: Text(
                          "Expense",
                          style: TextStyle(color: grey1),
                        ),
                        trailingIcon: Icon(
                          CupertinoIcons.chevron_down,
                          color: grey1,
                          size: 18,
                        ),
                        selectedTrailingIcon: Icon(
                          CupertinoIcons.chevron_up,
                          color: grey1,
                          size: 18,
                        ),
                        menuStyle: const MenuStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
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
                            expenseControllers[i].text = value!;
                          });
                        },
                        controller: expenseControllers[i],
                        // underline: SizedBox.shrink(),
                        dropdownMenuEntries: expenseType
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                            value: value,
                            label: value,
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextBox(
                          controller: amountControllers[i],
                          hinttext: "Amount",
                          label: "",
                          obscureText: false,
                          isNumber: true,
                          width: 90,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final file = await _imageHelper.getImage();
                          if (file != null) {
                            final cropped = await _imageHelper.crop(
                                file, CropStyle.rectangle);
                            if (cropped != null) {
                              setState(() {
                                images[i] = cropped;
                              });
                            }
                          }
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(5),
                          strokeWidth: 0.8,
                          dashPattern: const [7, 7],
                          color: grey1,
                          child: Container(
                            height: 45,
                            width: 80,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(3),
                            child: images[i] == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.file_upload_outlined,
                                        color: grey1,
                                        size: 20,
                                      ),
                                      Text(
                                        "Upload",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grey1,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(images[i]!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      removeExpense();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: red3.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(0),
                      minimumSize: const Size(80, 30),
                      maximumSize: const Size(80, 30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.delete_solid,
                          color: red1,
                          size: 17,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Remove",
                          style: TextStyle(
                            color: red1,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addExpense();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(0),
                      minimumSize: const Size(80, 30),
                      maximumSize: const Size(80, 30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_rounded,
                          color: color1,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Expense",
                          style: TextStyle(
                            color: color1,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "₹ 100110",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: color1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(0),
                  minimumSize: const Size(double.infinity, 50),
                  maximumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
