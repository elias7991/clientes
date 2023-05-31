import 'package:clientes/utils/constants.dart';
import 'package:flutter/material.dart';

enum ActionStatus {success, fail}

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