import 'package:clientes/screens/typeOfClient.dart';
import 'package:clientes/widgets/client_avatar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/Client.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';

Widget clientProfile(BuildContext context, Client client) {
  return GestureDetector(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 32),
                child: clientAvatar(context, client.avatar)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${client.firstName} ${client.lastName}'),
                Text.rich(
                    TextSpan(
                        text: client.email,
                        style: Constants.linkTextStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showMessage(
                                context: context,
                                message: "Funcionalidad para mandar correo.",
                                action: ActionStatus.success
                            );
                          }
                    )
                )
              ],
            )
          ],
        ),
      )
    ),
    onTap: () {
      // get the type of client
      final ClientType type = getClientType();
      // go to the new screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => TypeOfClient(type: type)
        )
      );
    },
  );
}