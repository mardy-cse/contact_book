import 'package:flutter/material.dart';

class TodoViewWidget extends StatelessWidget {
  final String title;
  final String description;
  final void Function()? onTap;
  final void Function()? option;

  const TodoViewWidget(
      {super.key,
      required this.title,
      required this.description,
      this.onTap,
      this.option});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                GestureDetector(onTap: option, child: Icon(Icons.more_vert))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
