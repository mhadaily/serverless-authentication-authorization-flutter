import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/coffee.dart';

final Color darkBrown = Color(0xFFA26E47);
final Color lightBrown = Color(0xFFF9E8D4);
final Color brown = Color(0xFF9C5700);
final Color facebookColor = Color(0xFF4867AA);

final List<Coffee> coffees = [
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Espresso ", price: 8),
  Coffee(coffeeIcon: FontAwesomeIcons.mugHot, name: "Cappuccino", price: 10),
  Coffee(coffeeIcon: FontAwesomeIcons.cocktail, name: "Mocha", price: 12),
  Coffee(coffeeIcon: FontAwesomeIcons.beer, name: "Americano", price: 7),
  Coffee(
    coffeeIcon: FontAwesomeIcons.cocktail,
    name: "Italian Macchiato",
    price: 5,
  ),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Flat White", price: 3),
  Coffee(
    coffeeIcon: FontAwesomeIcons.mugHot,
    name: "American Affogato",
    price: 11,
  ),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Long Black", price: 4),
  Coffee(coffeeIcon: FontAwesomeIcons.mugHot, name: "Latte", price: 12),
  Coffee(
    coffeeIcon: FontAwesomeIcons.cocktail,
    name: "American Espresso",
    price: 9,
  ),
  Coffee(coffeeIcon: FontAwesomeIcons.beer, name: "CAFÈ AU LAIT.", price: 10),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "AFFÈ MOCHA.", price: 12),
  Coffee(coffeeIcon: FontAwesomeIcons.beer, name: "Americano", price: 7),
  Coffee(
    coffeeIcon: FontAwesomeIcons.cocktail,
    name: "Double Exspersso",
    price: 5,
  ),
];

const AUTH0_DOMAIN = String.fromEnvironment('AUTH0_DOMAIN');
const AUTH0_CLIENT_ID = String.fromEnvironment('AUTH0_CLIENT_ID');
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
const BUNDLE_IDENTIFIER = 'mj.coffee.app';
const AUTH0_REDIRECT_URI = '$BUNDLE_IDENTIFIER://login-callback';
