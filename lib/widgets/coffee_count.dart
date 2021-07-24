import 'package:flutter/material.dart';

import 'button.dart';

class CoffeeCount extends StatefulWidget {
  CoffeeCount({
    Key? key,
    this.price,
    this.notifyValue,
  }) : super(key: key);

  final num? price;
  final Function(int)? notifyValue;

  @override
  _CoffeeCountState createState() => _CoffeeCountState();
}

class _CoffeeCountState extends State<CoffeeCount> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            if (count > 1) {
              setState(() {
                count = count - 1;
              });
            }
            widget.notifyValue!(count);
          },
          child: Icon(Icons.remove),
        ),
        SizedBox(width: 20),
        Text(
          "$count",
          style: TextStyle(
            color: Colors.brown.shade800,
            fontSize: 26,
          ),
        ),
        SizedBox(width: 20),
        TextButton(
          onPressed: () {
            setState(() {
              count = count + 1;
            });
            widget.notifyValue!(count);
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
