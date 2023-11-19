import 'package:basic_crud_users/components/field_form.dart';
import 'package:basic_crud_users/user_provider.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {

  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  String title = 'Show user';

  TextEditingController controllerName = TextEditingController();

  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;

      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/list');
              },
              child: const Icon(Icons.list),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            FirldForm(
              isEmail: false,
              isForm: false,
              label: 'Name',
              isPassword: false,
              controller: controllerName,
            ),
            const SizedBox(
              height: 20,
            ),
            FirldForm(
              isEmail: true,
              isForm: false,
              label: 'E-mail',
              isPassword: false,
              controller: controllerEmail,
            ),
            const SizedBox(
              height: 20,
            ),
            FirldForm(
              isEmail: false,
              isForm: false,
              label: 'Password',
              isPassword: false,
              controller: controllerPassword,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColorDark),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/create');
                },
                child: const Text("Edit"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  userProvider.indexUser = null;
                  userProvider.users.removeAt(index!);
                  Navigator.popAndPushNamed(context, '/list');
                },
                child: const Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
