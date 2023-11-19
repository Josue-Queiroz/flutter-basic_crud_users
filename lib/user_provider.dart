import 'package:basic_crud_users/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class UserProvider extends InheritedWidget {
  // ignore: annotate_overrides
  final Widget child;

  List<User> users = [];

  User? userSelected;
  int? indexUser;

  UserProvider({
    super.key,
    required this.child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider widget) {
    return true;
  }
}
