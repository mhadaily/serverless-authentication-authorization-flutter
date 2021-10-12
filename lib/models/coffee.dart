import 'package:flutter/material.dart';

class Coffee {
  const Coffee({
    required this.coffeeIcon,
    required this.name,
    required this.price,
    required this.id,
  });

  final IconData coffeeIcon;
  final String name;
  final int price;
  final int id;
}
