import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class User {
  final String name;

  User({required this.name});
}

enum LoaderState { none, pending, completed, rejected }

class AuthStore {
  final user = Observable<User?>(null);

  BuildContext? _context = null;

  BuildContext? get context => _context;

  final loginState = Observable(LoaderState.none);

  Future<void> login(BuildContext context) async {
    runInAction(() => loginState.value = LoaderState.pending);

    try {
      await Future.delayed(Duration(seconds: 2));

      runInAction(() {
        user.value = User(name: 'Majid & Pavan');
        loginState.value = LoaderState.completed;

        this._context = context;
      });
    } catch (e) {
      runInAction(() {
        user.value = null;
        loginState.value = LoaderState.rejected;
      });
    }
  }

  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 2));

    runInAction(() {
      user.value = null;
    });
  }
}

class CoffeeAppStore {
  // State -- start
  final numberOfCoffees = Observable(0);

  final auth = AuthStore();

  // State -- end

  CoffeeAppStore() {
    setupReactions();
  }

  setupReactions() {
    reaction((_) => auth.loginState.value, (state) {
      // auth.navigateToMenu();
    });
  }
}

final coffeeStore = CoffeeAppStore();
