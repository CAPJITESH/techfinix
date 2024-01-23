import 'package:flutter/material.dart';

import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Polices/policy_card.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({super.key});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  int index = 0;

  List<Map<String, dynamic>> companyPolicyList = [
    {
      "policy_name": "Company Policy 1",
    },
    {
      "policy_name": "Company Policy 2",
    },
    {
      "policy_name": "Company Policy 3",
    },
    {
      "policy_name": "Company Policy 4",
    },
    {
      "policy_name": "Company Policy 5",
    },
    {
      "policy_name": "Company Policy 6",
    },
    {
      "policy_name": "Company Policy 7",
    },
    {
      "policy_name": "Company Policy 8",
    },
    {
      "policy_name": "Company Policy 9",
    },
    {
      "policy_name": "Company Policy 10",
    },
    {
      "policy_name": "Company Policy 11",
    },
    {
      "policy_name": "Company Policy 12",
    },
  ];

  List<Map<String, dynamic>> hrPolicyList = [
    {
      "policy_name": "HR Policy 1",
    },
    {
      "policy_name": "HR Policy 2",
    },
    {
      "policy_name": "HR Policy 3",
    },
    {
      "policy_name": "HR Policy 4",
    },
    {
      "policy_name": "HR Policy 5",
    },
    {
      "policy_name": "HR Policy 6",
    },
    {
      "policy_name": "HR Policy 7",
    },
    {
      "policy_name": "HR Policy 8",
    },
    {
      "policy_name": "HR Policy 9",
    },
    {
      "policy_name": "HR Policy 10",
    },
    {
      "policy_name": "HR Policy 11",
    },
    {
      "policy_name": "HR Policy 12",
    },
  ];

  List<Map<String, dynamic>> get filteredPolicyList {
    final String searchText = _searchController.text.toLowerCase();
    final List<Map<String, dynamic>> policyList =
        index == 0 ? companyPolicyList : hrPolicyList;

    return policyList
        .where((policy) =>
            policy['policy_name'].toLowerCase().contains(searchText))
        .toList();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
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
                'Policies',
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
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 40,
                    width: 240,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 115,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == 0 ? color1 : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Company",
                              style: TextStyle(
                                color: index == 0 ? Colors.white : color1,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 115,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == 1 ? color1 : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "HR",
                              style: TextStyle(
                                color: index == 1 ? Colors.white : color1,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(color: grey1),

                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        // error: SizedBox.shrink(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        suffixIcon: Container(
                          height: 10,
                          width: 10,
                          constraints:
                              const BoxConstraints(maxHeight: 10, maxWidth: 10),
                          decoration: BoxDecoration(
                            color: color1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredPolicyList.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 13),
                      child: PolicyCard(data: filteredPolicyList[i]),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
