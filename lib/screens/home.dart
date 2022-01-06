import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mjcoffee/models/coffee_store.dart';
import 'package:mjcoffee/widgets/button.dart';

class HomeScreen extends StatelessWidget {
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
            LoginButton(),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final loginState = coffeeStore.auth.loginState.value;

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (loginState == LoaderState.pending) CircularProgressIndicator(),
          CommonButton(
            onPressed: loginState == LoaderState.pending
                ? null
                : () {
                    coffeeStore.auth.login(context);
                  },
            text: 'Sign In / Sign Up',
          ),
          if (loginState == LoaderState.rejected) Text('Error!'),
        ],
      );
    });
  }
}
