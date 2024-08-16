import 'package:flutter/material.dart';

class DrawerListviewWidget extends StatelessWidget {
  final IconData? icon;
  final String tittle;

  const DrawerListviewWidget(
      {super.key, required this.icon, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(tittle),
    );
  }
}
