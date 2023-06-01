import 'dart:math';

import 'package:clientes/utils/constants.dart';
import 'package:flutter/material.dart';

// enum to handle the type of alert
enum ActionStatus {success, fail}
// show alert in the screen
void showMessage({
  required BuildContext context,
  required String message,
  required ActionStatus action,
  Widget? icon,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      behavior: SnackBarBehavior.floating,
      // z-index
      elevation: 1,
      // color depends on the action
      backgroundColor: action == ActionStatus.fail
        ? Constants.fail
        : Constants.success,
      content: Row(
        children: [
          if (icon != null) Padding(
              padding: const EdgeInsets.only(left: 8),
              child: icon),
          Expanded(
            child: Text(
              message,
              // style depends on the action
              style: action == ActionStatus.fail
                  ? Constants.alertTextStyle.copyWith(color: Colors.white)
                  : Constants.infoTextStyle.copyWith(color: Colors.white)
              ,
            ),
          )
        ],
      ),
    )
  );
}

// function to return number between one and "max"
int randomNumber(int max) {
  // instance of class
  Random random = Random();

  return random.nextInt(max);
}

// enum to handle the types of client
enum ClientType {active, inactive, blocked, unknown}
// function to handle the type of client
ClientType getClientType() {
  final int number = randomNumber(100);

  if (number < 20) {
    return ClientType.active;
  } else if (number%20 == 0) {
    return ClientType.inactive;
  } else if (number > 20 && number%20 != 0) {
    return ClientType.blocked;
  } else {
    return ClientType.unknown;
  }

}


String stringType(ClientType type) {
  late String typeInString;

  switch(type) {
    case ClientType.active: {
      typeInString = "Cliente activo";
      break;
    }
    case ClientType.inactive: {
      typeInString = "Cliente inactivo";
      break;
    }
    case ClientType.blocked: {
      typeInString = "Cliente bloqueado";
    }
    default:
      typeInString = "Indefinido";
  }

  return typeInString;
}