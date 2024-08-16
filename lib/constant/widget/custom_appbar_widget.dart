import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String appBarTitle;
  List<Widget>? action;

  CustomAppbarWidget({required this.appBarTitle, this.action});

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
      actions: action,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
