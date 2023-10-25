// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:insta2/homesscreen.dart';
import 'package:insta2/splashhscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable, camel_case_types
class loginnscreen extends StatelessWidget {
  loginnscreen({super.key});
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  String user = 'shadin';
  String pass = '12345';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: SizedBox(
                          // ignore: sort_child_properties_last
                          child:
                              Image.asset('assets/images/instagram-logo.png'),
                          height: 60),
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.green),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        prefixIcon: Icon(Icons.account_box_rounded),
                        prefixIconColor: Colors.grey,
                        labelText: 'username',
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                      validator: (value) {
                        if (value == user) {
                          return null;
                        } else if (value == "") {
                          return "please enter your username";
                        } else {
                          return "username doesnt exist";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.green),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.grey,
                        labelText: 'password',
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                      validator: (value) {
                        if (value == pass) {
                          return null;
                        } else if (value == "") {
                          return "please enter your password";
                        } else {
                          return "incorrect password";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            checklogin(context);
                          } else {
                            'username and password does not match';
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.red,
                                    margin: EdgeInsets.all(10),
                                    content: Text(' Please Try Again')));
                          }
                        },
                        child: const Text(
                          ' Log in ',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void checklogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == user && _password == pass) {
      //go to home
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => const homesscreen(),
        ),
      );
    } else {}
  }
}
