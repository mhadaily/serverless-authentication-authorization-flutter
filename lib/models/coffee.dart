import 'package:flutter/material.dart';

class Coffee {
  const Coffee({
    required this.coffeeIcon,
    required this.name,
    required this.price,
  });

  final IconData coffeeIcon;
  final String name;
  final int price;
}
