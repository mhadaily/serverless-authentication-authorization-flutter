import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjcoffee/screens/menu.dart';
import 'package:mjcoffee/services/coffee_router.dart';
import 'package:mjcoffee/widgets/button.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';
  static Route<HomeScreen> route() {
    return MaterialPageRoute<HomeScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => HomeScreen(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final loginScaffoldKey = GlobalKey<ScaffoldState>();

  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage = '';
  String? name;
  String? picture;

  @override
  void initState() {
    /// -----------------------------------
    /// implement init action
    /// -----------------------------------
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              height: 150,
              width: 150,
            ),
            SvgPicture.asset(
              "assets/hangout.svg",
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              semanticsLabel: 'MJ Coffee',
              fit: BoxFit.fitWidth,
            ),
            Text(
              "Get the best coffee!",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (isBusy)
                  CircularProgressIndicator()
                else if (!isLoggedIn)
                  CommonButton(
                    onPressed: () {
                      // CoffeeRouter.instance.pushReplacement(MenuScreen.route());
                      context.goNamed('menu');

                      /// -----------------------------------
                      /// implement login action
                      /// -----------------------------------
                    },
                    text: 'Sign In / Sign Up',
                  )
                else
                  Text('Welcome $name'),
              ],
            ),
            if (errorMessage.isNotEmpty) Text(errorMessage),
          ],
        ),
      ),
    );
  }
}
