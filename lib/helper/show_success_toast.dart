import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

showSuccessToast(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);
  fToast.showToast(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.circleCheck),
                SizedBox(
                  width: 10,
                ),
                Text("Success"),
              ],
            ),
          )),
      toastDuration: const Duration(milliseconds: 900),
      gravity: ToastGravity.BOTTOM);
}
