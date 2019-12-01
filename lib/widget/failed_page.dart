import 'dart:ui';

import 'package:flutter/material.dart';

class FailedPage extends StatelessWidget {
  final String errorMsg;

  const FailedPage({Key key, @required this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error,
            size: 50,
            color: Colors.redAccent,
          ),
          renderText(),
        ],
      ),
    );
  }

  Text renderText() {
    return errorMsg == null
        ? null
        : Text(
            errorMsg,
            style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w800),
          );
  }
}
