import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mjcoffee/models/coffee_store.dart';
import 'package:mjcoffee/screens/home.dart';
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
        Observer(
          builder: (_) {
            return Text('Hello ${coffeeStore.auth.user.value?.name}');
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CommonButton(
            onPressed: () async {
              GoRouter.of(context).goNamed('home');

              /// -----------------------------------
              ///  perform logout and if success disconnect chat and redirect to home screen
              /// -----------------------------------
            },
            text: 'Logout',
          ),
        ),
      ],
    );
  }
}
