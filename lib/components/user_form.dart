import 'package:basic_crud_users/components/container_all.dart';
import 'package:basic_crud_users/components/field_form.dart';
import 'package:basic_crud_users/models/user.dart';
import 'package:basic_crud_users/user_provider.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String title = 'New user';

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;

    if (userProvider.indexUser != null) {
      setState(() {
        title = 'Edit user';
      });

      index = userProvider.indexUser;

      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }

    GlobalKey<FormState> _key = GlobalKey();

    void saveUser() {
      final isVaidate = _key.currentState?.validate();

      if (isVaidate == false) {
        return;
      }

      _key.currentState?.save();

      int users = userProvider.users.length;
      User user = User(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
      );

      if (index != null) {
        userProvider.users[0] = user;
      } else {
        userProvider.users.insert(users, user);
      }

      Navigator.popAndPushNamed(context, '/list');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/list');
              },
              child: const Icon(Icons.list),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ContainerAll(
          child: Center(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  FirldForm(
                    isEmail: false,
                    label: 'Name',
                    isPassword: false,
                    controller: controllerName,
                  ),
                  FirldForm(
                    isEmail: true,
                    label: 'E-mail',
                    isPassword: false,
                    controller: controllerEmail,
                  ),
                  FirldForm(
                    isEmail: false,
                    label: 'Password',
                    isPassword: true,
                    controller: controllerPassword,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColorDark),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: saveUser,
                      child: const Text("Salvar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
