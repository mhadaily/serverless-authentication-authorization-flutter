import 'package:flutter/material.dart';

enum CoffeeCupSize { small, medium, large }

class CoffeeSize extends StatefulWidget {
  CoffeeSize({
    Key? key,
    this.icon,
  }) : super(key: key);

  final IconData? icon;

  @override
  _CoffeeSizeState createState() => _CoffeeSizeState();
}

class _CoffeeSizeState extends State<CoffeeSize> {
  CoffeeCupSize size = CoffeeCupSize.medium;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Size",
          style: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(width: 50),
        IconButton(
          icon: Icon(
            widget.icon,
            color: getColor(size == CoffeeCupSize.small),
          ),
          onPressed: () {
            setState(() {
              size = CoffeeCupSize.small;
            });
          },
        ),
        IconButton(
          icon: Icon(
            widget.icon,
            color: getColor(size == CoffeeCupSize.medium),
            size: 30,
          ),
          onPressed: () {
            setState(() {
              size = CoffeeCupSize.medium;
            });
          },
        ),
        IconButton(
          icon: Icon(
            widget.icon,
            color: getColor(size == CoffeeCupSize.large),
            size: 36,
          ),
          onPressed: () {
            setState(() {
              size = CoffeeCupSize.large;
            });
          },
        ),
      ],
    );
  }

  getColor(bool isSelected) {
    return isSelected ? Colors.brown.shade800 : Colors.grey.shade400;
  }
}
