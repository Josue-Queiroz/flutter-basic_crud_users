import 'package:basic_crud_users/components/container_all.dart';
import 'package:basic_crud_users/models/user.dart';
import 'package:basic_crud_users/user_provider.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    List<User> users = userProvider.users;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            userProvider.indexUser = null;
            Navigator.popAndPushNamed(context, '/create');
          },
        ),
        title: const Text('User list'),
      ),
      body: ContainerAll(
        // ignore: prefer_is_empty
        child: (users.length < 1)
            ? const Center(
                child: Text(
                  "Empty list",
                  style: TextStyle(color: Colors.grey, fontSize: 25),
                ),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, index) => Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.4),
                    ),
                  ),
                  child: ListTile(
                    title: Text(users[index].name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            userProvider.userSelected = users[index];
                            userProvider.indexUser = index;

                            Navigator.popAndPushNamed(context, '/create');
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            userProvider.userSelected = users[index];
                            userProvider.indexUser = index;

                            Navigator.popAndPushNamed(context, '/view');
                          },
                          icon: const Icon(
                            Icons.visibility,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            userProvider.userSelected = null;
                            userProvider.users.removeAt(index);

                            Navigator.popAndPushNamed(context, '/list');
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
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
