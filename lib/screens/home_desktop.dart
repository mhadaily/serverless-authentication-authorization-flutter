import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:mjcoffee/helpers/constants.dart';
import 'package:mjcoffee/widgets/button.dart';
import 'package:go_router/go_router.dart';

import 'menu.dart';
import 'menu_list.dart';

class HomeDesktopScreen extends StatefulWidget {
  @override
  _HomeDesktopScreenState createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  final loginScaffoldKey = GlobalKey<ScaffoldState>();

  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage = '';
  String? name;
  String? picture;
  int sidebarIndex = 0;

  @override
  void initState() {
    /// -----------------------------------
    /// implement init action
    /// -----------------------------------
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        builder: (BuildContext context, ScrollController scrollController) {
          return SidebarItems(
            currentIndex: sidebarIndex,
            onChanged: (value) {
              setState(() => sidebarIndex = value);
            },
            items: [
              SidebarItem(label: Text('Home')),
              SidebarItem(label: Text('Menu')),
              SidebarItem(label: Text('Profile')),
            ],
          );
        },
        minWidth: 200,
        maxWidth: 400,
        startWidth: 200,
      ),
      child: MacosScaffold(
        children: [
          ContentArea(
            builder: (context, scrollController) {
              return IndexedStack(
                index: sidebarIndex,
                children: [
                  Column(
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
                  //   MenuList(
                  //     coffees: coffees,
                  //     scrollController: scrollController,
                  //   ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
