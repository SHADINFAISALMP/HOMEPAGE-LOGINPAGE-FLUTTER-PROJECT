import 'package:flutter/material.dart';
import 'package:insta2/loginnscreen.dart';
import 'package:insta2/splashhscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class homesscreen extends StatelessWidget {
  const homesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'INSTAGRAM',
          style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: const Icon(Icons.exit_to_app),
            color: Colors.black,
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(
                  'PERSON $index',
                  style: const TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
                subtitle: const Text(
                  'Hey Shadin',
                  style: TextStyle(
                      color: Color.fromARGB(208, 19, 170, 235),
                      fontStyle: FontStyle.italic),
                ),
                leading: index % 2 == 0
                    ? const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://i.pngimg.me/thumb/f/720/4f78a03f3b.jpg'),
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://i.pinimg.com/736x/ca/8f/ca/ca8fca670f3cb98f7ae207a142024cbb.jpg',
                            ),
                          ),
                        ),
                      ),
                trailing: Text(
                  '$index:00pm',
                  style:
                      const TextStyle(color: Color.fromARGB(255, 44, 165, 48)),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider(
                color: Color.fromARGB(255, 221, 227, 221),
              );
            },
            itemCount: 10),
      ),
    );
  }

  signout(BuildContext ctx) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setBool(SAVE_KEY_NAME, false);
    // ignore: use_build_context_synchronously
    showDialog(
        context: ctx,
        builder: (ctx1) {
          return AlertDialog(
            backgroundColor: Colors.cyan,
            title: const Text('LOG OUT '),
            content: const Text('Are You Sure?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(ctx1).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => loginnscreen()),
                      (route) => false);
                },
                child: const Text('YES'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: const Text('NO'),
              ),
            ],
          );
        });
  }
}
