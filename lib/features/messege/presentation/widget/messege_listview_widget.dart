import 'package:flutter/material.dart';

class MessegeListviewWidget extends StatelessWidget {
  final String msgIcon;
  final String name;
  final String time;

  MessegeListviewWidget({
    super.key,
    required this.msgIcon,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(msgIcon),
              ),
              title: Center(child: Text(name)),
              trailing: Text(time),
            ),
          ],
        ),
      ),
    );
    // trailing: Text(time ));
  }
}
