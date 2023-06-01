import 'package:clientes/utils/helpers.dart';
import 'package:flutter/material.dart';

class TypeOfClient extends StatelessWidget {
  final ClientType type;

  const TypeOfClient({
    super.key,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // go to previous screen
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Text(stringType(type))
      ),
    );
  }
}