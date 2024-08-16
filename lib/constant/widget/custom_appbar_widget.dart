import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String appBarTitle;
  List<Widget>? action;
  bool isLeadingIcon;

  CustomAppbarWidget(
      {super.key,
      required this.appBarTitle,
      this.action,
      this.isLeadingIcon = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle.toUpperCase(),
        softWrap: true,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.indigo,
      actions: action,
      iconTheme: IconThemeData(color: Colors.white),
      leading: isLeadingIcon
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                // color: Colors.white,
              ),
            )
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
