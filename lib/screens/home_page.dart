import 'package:assist_queen/screens/event/event_page.dart';
import 'package:assist_queen/screens/profile/profile_page.dart';
import 'package:assist_queen/screens/wallet/components/wallet_page.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  static var bodyWidgets = <Widget>[
    const EventPage(),
    const WalletPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/bg_img.png'))),
          child: bodyWidgets[index]),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.event, title: "Event"),
          TabData(iconData: Icons.account_balance_wallet, title: "Wallet"),
          TabData(iconData: Icons.person, title: "Profile")
        ],
        onTabChangedListener: (int position) {
          setState(() {
            index = position;
          });
        },
      ),
    );
  }
}
