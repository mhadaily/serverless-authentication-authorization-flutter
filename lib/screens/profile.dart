import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjcoffee/screens/home.dart';
import 'package:mjcoffee/services/auth_service.dart';
import 'package:mjcoffee/services/coffee_router.dart';
import 'package:mjcoffee/widgets/button.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = 'ProfileScreen';
  static Route<ProfileScreen> route() {
    return MaterialPageRoute<ProfileScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                "assets/coffee_break.svg",
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                semanticsLabel: 'MJ Coffee',
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CommonButton(
            onPressed: () async {
              await AuthService.instance.logout();
              CoffeeRouter.instance.pushReplacement(HomeScreen.route());
            },
            text: 'Logout',
          ),
        ),
      ],
    );
  }
}
