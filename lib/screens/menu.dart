import 'package:flutter/material.dart';
import 'package:mjcoffee/screens/profile.dart';
import 'package:mjcoffee/screens/support.dart';

import '../helpers/constants.dart';
import './menu_list.dart';
import 'community.dart';

class MenuScreen extends StatefulWidget {
  static String routeName = 'menuScreen';
  static Route<MenuScreen> route() {
    return MaterialPageRoute<MenuScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => MenuScreen(),
    );
  }

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    MenuList(coffees: coffees),

    /// -----------------------------------
    ///  CommunityView or ChatView based on role
    /// -----------------------------------
    if (true) CommunityView() else ChatView(),

    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// -----------------------------------
    ///  profile
    /// -----------------------------------

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text("Welcome"),
        actions: [
          /// -----------------------------------
          ///  implement avatar
          /// -----------------------------------
        ],
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.brown.shade300,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Menu",
        ),

        /// -----------------------------------
        ///  BottomNavigationBarItem nased on user role
        /// -----------------------------------
        BottomNavigationBarItem(
          icon: 1 == 1 ? Icon(Icons.support_agent) : Icon(Icons.group),
          label: 1 == 1 ? "Support" : "Community",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.brown.shade800,
      onTap: _onItemTapped,
    );
  }
}
