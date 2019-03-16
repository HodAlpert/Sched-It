import 'package:flutter/material.dart';
class Button {
  final String Name;
  final GestureTapCallback onTap;
  final IconData icon;

  Button(this.Name, this.onTap, this.icon);

  make_button(BuildContext context) {
      return ListTile(
          leading: Icon(icon),
      title: Text(this.Name,
      style: TextStyle(fontSize:17.0)),
        onTap: onTap
      );
    }
}
