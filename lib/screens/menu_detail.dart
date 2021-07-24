import 'package:flutter/material.dart';
import 'package:mjcoffee/widgets/button.dart';
import '../widgets/coffee_additions.dart';
import '../widgets/coffee_count.dart';
import '../widgets/coffee_size.dart';
import '../widgets/coffee_sugar.dart';
import '../models/coffee.dart';
import '../helpers/constants.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({
    required this.coffee,
  });

  static String routeName = 'loginScreen';
  static Route<MenuDetails> route({required Coffee coffee}) {
    return MaterialPageRoute<MenuDetails>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => MenuDetails(
        coffee: coffee,
      ),
    );
  }

  final Coffee coffee;

  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  int totalCount = 1;

  int get total {
    return totalCount * widget.coffee.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffee.name),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: lightBrown,
              child: Icon(
                widget.coffee.coffeeIcon,
                size: 120,
                color: brown,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CoffeeCount(
                      price: widget.coffee.price,
                      notifyValue: (int count) {
                        setState(() {
                          totalCount = count;
                        });
                      },
                    ),
                    Divider(height: 3),
                    CoffeeSize(icon: widget.coffee.coffeeIcon),
                    Divider(height: 3),
                    CoffeeSugar(),
                    Divider(height: 3),
                    CoffeeAdditions(),
                    Divider(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total:",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "\$$total",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    CommonButton(
                      onPressed: () {},
                      text: 'Add to cart',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
