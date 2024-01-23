import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Vouchers/add_voucher.dart';
import 'package:techfinix/screens/Vouchers/vouchers_card.dart';

class VoucherListPage extends StatefulWidget {
  const VoucherListPage({super.key});

  @override
  State<VoucherListPage> createState() => _VoucherListPageState();
}

class _VoucherListPageState extends State<VoucherListPage> {
  List<Map<String, dynamic>> data = [
    {
      "project_name": "EASTERN FREEWAY",
      "type": "Bank Charges / TT Charges",
      "price": "₹ 1100",
      "voucher_code": "#1453245",
      "date": "17 Dec 2023",
      "details":
          "Amount deducted by bank as interest for the company mortgage EMI paid late",
      "status": "ACCEPTED",
      "color": green1,
    },
    {
      "project_name": "WESTERN EXPRESS",
      "type": "Consulting Fees",
      "price": "₹ 2500",
      "voucher_code": "#9876543",
      "date": "20 Dec 2023",
      "details":
          "Consulting fees for providing financial advice on the upcoming project",
      "status": "REJECTED",
      "color": red1,
    },
    {
      "project_name": "SOUTHERN BYPASS",
      "type": "Travel Expenses",
      "price": "₹ 800",
      "voucher_code": "#5678912",
      "date": "22 Dec 2023",
      "details": "Reimbursement for travel expenses during project site visit",
      "status": "PENDING",
      "color": yellow,
    },
    {
      "project_name": "NORTHERN LINK",
      "type": "Material Procurement",
      "price": "₹ 3500",
      "voucher_code": "#1122334",
      "date": "25 Dec 2023",
      "details": "Procurement of construction materials for the project",
      "status": "ACCEPTED",
      "color": green1,
    },
    {
      "project_name": "CENTRAL EXPRESSWAY",
      "type": "Equipment Rental",
      "price": "₹ 1800",
      "voucher_code": "#4455667",
      "date": "28 Dec 2023",
      "details": "Rental charges for heavy equipment used in construction",
      "status": "PENDING",
      "color": yellow,
    },
    {
      "project_name": "COASTAL HIGHWAY",
      "type": "Design Services",
      "price": "₹ 3000",
      "voucher_code": "#7788990",
      "date": "2 Jan 2024",
      "details": "Payment for architectural design services",
      "status": "REJECTED",
      "color": red1,
    },
    {
      "project_name": "MOUNTAIN PASS",
      "type": "Legal Consultation",
      "price": "₹ 1200",
      "voucher_code": "#3344556",
      "date": "5 Jan 2024",
      "details": "Legal consultation fees for project compliance",
      "status": "ACCEPTED",
      "color": green1,
    },
    {
      "project_name": "DESERT HIGHWAY",
      "type": "Advertising Expenses",
      "price": "₹ 900",
      "voucher_code": "#6677889",
      "date": "8 Jan 2024",
      "details": "Advertising expenses for project promotion",
      "status": "PENDING",
      "color": yellow,
    },
    {
      "project_name": "URBAN RENEWAL",
      "type": "Utilities Payment",
      "price": "₹ 950",
      "voucher_code": "#9900112",
      "date": "11 Jan 2024",
      "details": "Payment for water and electricity utilities during project",
      "status": "REJECTED",
      "color": red1,
    },
    {
      "project_name": "RURAL DEVELOPMENT",
      "type": "Training Costs",
      "price": "₹ 1600",
      "voucher_code": "#2233445",
      "date": "14 Jan 2024",
      "details": "Costs associated with training sessions for project teams",
      "status": "ACCEPTED",
      "color": green1,
    },
  ];

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
                'Vouchers',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddVoucherPage(),
                          ),
                        );
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: VoucherCard(
                          data: data[index],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
