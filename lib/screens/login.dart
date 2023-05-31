import 'package:clientes/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/helpers.dart';
import 'home.dart';

class Login extends StatefulWidget {
  // constructor of the class
  const Login({ super.key });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // define of private controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  // this executed at the start
  void initState() {
    super.initState();
  }

  // this executed at the end
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // this widget use to handle fields focus
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // prevent possible overflow
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // username section
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 25),
                child: TextField(
                  controller: _usernameController,
                  inputFormatters: [
                    // regular expression to omit numbers between 0 and 9
                    FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                  ],
                  obscureText: false,
                  decoration: const InputDecoration(
                    // person icon for texfield
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'username'
                  ),
                ),
              ),
              // password section
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 25),
                child: TextField(
                  controller: _passwordController,
                  // for only show numeric keyboard
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    // regular expression to only allow numbers between 0 and 9
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  // this allow only five characters
                  maxLength: 5,
                  // hide text
                  obscureText: true,
                  decoration: const InputDecoration(
                    // password icon for textfield
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                      labelText: 'password'
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home()
                      ),
                      (route) => false
                    );
                  } else {
                    if (_usernameController.text.isEmpty) {
                      showMessage(
                          context: context,
                          message: Constants.emptyUsername,
                          action: ActionStatus.fail
                      );
                    }
                    if (_passwordController.text.isEmpty) {
                      showMessage(
                          context: context,
                          message: Constants.emptyPassword,
                          action: ActionStatus.fail
                      );
                    }
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        )
      )
    );
  }
}