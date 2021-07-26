import 'package:flutter/material.dart';
import 'package:mjcoffee/models/auth0_user.dart';
import 'package:mjcoffee/screens/profile.dart';
import 'package:mjcoffee/screens/support.dart';
import 'package:mjcoffee/services/auth_service.dart';

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
  Auth0User? profile = AuthService.instance.profile;

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> tabs = [
    MenuList(coffees: coffees),
    if (AuthService.instance.profile?.isCustomer)
      SupportChatScreen()
    else
      CommunityScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text("Welcome ${profile?.name}"),
        actions: [
          _avatar(profile),
        ],
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: _bottomNavigationBar(profile),
    );
  }

  BottomNavigationBar _bottomNavigationBar(Auth0User? user) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.brown.shade300,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Menu",
        ),
        BottomNavigationBarItem(
          icon:
              user?.isCustomer ? Icon(Icons.support_agent) : Icon(Icons.group),
          label: user?.isCustomer ? "Support" : "Community",
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

  Padding _avatar(Auth0User? profile) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        fit: BoxFit.cover,
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(600)),
          child: Container(
            child: _avatarPhoto(profile),
          ),
        ),
      ),
    );
  }

  Widget _avatarPhoto(Auth0User? profile) {
    return profile != null && profile.hasImage
        ? Image.network(
            profile.picture,
            width: 20,
            height: 20,
          )
        : Container(
            width: 20,
            height: 20,
            color: darkBrown,
            child: Center(
              child: Text('${profile?.name[0].toUpperCase()}'),
            ),
          );
  }
}
