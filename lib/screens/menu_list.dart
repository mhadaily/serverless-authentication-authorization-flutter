import 'dart:io';

import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:mjcoffee/models/coffee.dart';
import 'package:mjcoffee/helpers/constants.dart';
import 'package:go_router/go_router.dart';

class ListTileBuilderWidget extends StatelessWidget {
  const ListTileBuilderWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isAndroid) {
      return ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        leading: Icon(
          icon,
          size: 40,
          color: brown,
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      );
    } else if (Platform.isMacOS) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: MacosListTile(
          title: Text(
            title,
            style: MacosTheme.of(context).typography.headline,
          ),
          subtitle: Text(
            subtitle,
            style: MacosTheme.of(context).typography.subheadline,
          ),
          leading: Icon(
            icon,
            size: 40,
            color: brown,
          ),
        ),
      );
    }
    return Container();
  }
}

class MenuList extends StatefulWidget {
  const MenuList({
    required this.coffees,
    this.scrollController,
  });

  final List<Coffee> coffees;
  final ScrollController? scrollController;

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Coffee> _items = [];

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      controller: widget.scrollController,
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) {
        return slideIt(context, index, animation);
      },
    );
  }

  Future<void> _loadItems() async {
    for (Coffee item in widget.coffees) {
      await Future.delayed(Duration(milliseconds: 80));
      _items.add(item);
      listKey.currentState?.insertItem(_items.length - 1);
    }
  }

  Widget slideIt(BuildContext context, int index, animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.bounceIn,
          reverseCurve: Curves.bounceOut,
        ),
      ),
      child: GestureDetector(
        child: ListTileBuilderWidget(
          icon: widget.coffees[index].coffeeIcon,
          title: _items[index].name,
          subtitle: _items[index].name,
        ),
        onTap: () {
          // CoffeeRouter.instance.push(
          //   MenuDetails.route(
          //     coffee: _items[index],
          //   ),
          // );
          // context.go('/menu/${_items[index].id}');
          context.goNamed(
            'details',
            params: {'id': _items[index].id.toString()},
          );
        },
      ),
    );
  }
}
