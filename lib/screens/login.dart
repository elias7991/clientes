import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({ super.key });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // this widget use to handle fields focus
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // username section
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 25),
                child: TextField(
                  inputFormatters: [
                    // regular expression to omit numbers between 0 and 9
                    FilteringTextInputFormatter.allow(r'[^0-9]')
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
                  // for only show numeric keyboard
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    // regular expression to only allow numbers between 0 and 9
                    FilteringTextInputFormatter.allow(r'[0-9]')
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