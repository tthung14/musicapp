import 'package:flutter/material.dart';

class AppListTitle extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function() onPress;
  final Widget training;
  const AppListTitle(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPress,
      required this.training});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: ListTile(
          leading: Container(
            child: icon,
          ),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Color(0xff121212)),
          ),
          trailing: Container(
            child: training,
          ),
        ),
    );
  }
}
