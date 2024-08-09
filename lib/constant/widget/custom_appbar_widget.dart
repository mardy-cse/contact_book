import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String appBarTitle;

  CustomAppbarWidget({required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle.toUpperCase(),
        softWrap: true,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.indigo,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
