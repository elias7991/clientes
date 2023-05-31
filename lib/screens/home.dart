import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ super.key });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  // this executed at the start
  void initState() {
    super.initState();
  }

  // this executed at the end
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }

}