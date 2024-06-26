import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Settings/Settings%20items/change_password.dart';
import 'package:techfinix/screens/Settings/Settings%20items/delete_account.dart';
import 'package:techfinix/screens/Settings/Settings%20items/logout.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final PanelController _controller = PanelController();
  int index = 0;
  bool isPanelOpen = false;

  Widget _buildPanelContent() {
    if (index == 1) {
      return LogoutSlidingPanel(
        controller: _controller,
      );
    } else {
      return DeleteAccount(
        controller: _controller,
      );
    }
  }

  double _panelHeight() {
    if (index == 1) {
      return MediaQuery.of(context).size.height * 0.24;
    } else {
      return MediaQuery.of(context).size.height * 0.24;
    }
  }

  void _togglePanel(int idx) {
    setState(() {
      index = idx;
      isPanelOpen ? _controller.close() : _controller.open();
      isPanelOpen = !isPanelOpen;
    });
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
                'Settings',
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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      constraints: const BoxConstraints(minHeight: 40),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.key_rounded,
                              color: color1,
                              size: 22,
                            ),
                            Container(width: 12),
                            Text(
                              "Change Password",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: black2,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: color1,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: grey1.withOpacity(0.7),
                      thickness: 0.5,
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      constraints: const BoxConstraints(minHeight: 40),
                      child: InkWell(
                        onTap: () {
                          _togglePanel(1);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.logout_rounded,
                              color: color1,
                              size: 22,
                            ),
                            Container(width: 12),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: black2,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: color1,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: grey1.withOpacity(0.7),
                      thickness: 0.5,
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      constraints: const BoxConstraints(minHeight: 40),
                      child: InkWell(
                        onTap: () {
                          _togglePanel(3);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              "assets/delete_acc.svg",
                              colorFilter: ColorFilter.mode(
                                color1,
                                BlendMode.srcIn,
                              ),
                              width: 18,
                              height: 18,
                            ),
                            Container(width: 15),
                            Text(
                              "Delete Account",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: black2,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: color1,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: grey1.withOpacity(0.7),
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
            ),
            SlidingUpPanel(
              controller: _controller,
              minHeight: 0.0,
              maxHeight: _panelHeight(),
              panelBuilder: (sc) {
                return _buildPanelContent();
              },
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              // backdropTapClosesPanel: true,
              // isDraggable: false,
              backdropEnabled: true,
              backdropColor: Colors.black,
              backdropOpacity: 0.4,

              onPanelClosed: () {
                index = 0;
                isPanelOpen = false;
              },
            )
          ],
        ),
      ),
    );
  }
}
