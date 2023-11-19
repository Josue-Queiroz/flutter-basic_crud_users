import 'package:basic_crud_users/components/user_form.dart';
import 'package:basic_crud_users/components/user_list.dart';
import 'package:basic_crud_users/components/user_view.dart';
import 'package:basic_crud_users/user_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD',
        home: const UserForm(),
        routes: {
          "/create": (context) => const UserForm(),
          "/list": (context) => const UserList(),
          "/view": (context) => const UserView(),
        },
      ),
    );
  }
}
