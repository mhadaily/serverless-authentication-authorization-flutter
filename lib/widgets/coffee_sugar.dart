import 'package:flutter/material.dart';

enum CoffeeSugerCube { no, one, two }

class CoffeeSugar extends StatefulWidget {
  CoffeeSugar({Key? key}) : super(key: key);

  @override
  _CoffeeSugarState createState() => _CoffeeSugarState();
}

class _CoffeeSugarState extends State<CoffeeSugar> {
  CoffeeSugerCube suger = CoffeeSugerCube.no;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Sugar",
          style: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(width: 40),
        IconButton(
          icon: Icon(
            Icons.close,
            color: getColor(suger == CoffeeSugerCube.no),
          ),
          onPressed: () {
            setState(() {
              suger = CoffeeSugerCube.no;
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.check_box_outline_blank,
            color: getColor(suger == CoffeeSugerCube.one),
          ),
          onPressed: () {
            setState(() {
              suger = CoffeeSugerCube.one;
            });
          },
        ),
        IconButton(
          icon: Row(
            children: <Widget>[
              Icon(
                Icons.check_box_outline_blank,
                color: getColor(suger == CoffeeSugerCube.two),
              ),
              Flexible(
                child: Icon(
                  Icons.check_box_outline_blank,
                  color: getColor(suger == CoffeeSugerCube.two),
                ),
              ),
            ],
          ),
          onPressed: () {
            setState(() {
              suger = CoffeeSugerCube.two;
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
