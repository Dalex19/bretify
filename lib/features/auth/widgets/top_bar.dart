import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.name,
    required this.nameSubtitle,
    required this.textButtonName,
    required this.changeToLogin
  });

  final String name;
  final String nameSubtitle;
  final String textButtonName;
  final VoidCallback changeToLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveValue(context,
                  defaultValue: 30.0,
                  conditionalValues: const [
                    Condition.smallerThan(name: MOBILE, value: 30.0),
                    Condition.largerThan(name: TABLET, value: 60.0)
                  ]).value,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubTitle(
                name: nameSubtitle,
                myTextColor: Colors.grey,
              ),
              TextButton(
                onPressed: changeToLogin,
                child: SubTitle(
                  name: textButtonName,
                  withTxtDecoration: TextDecoration.underline,
                  myTextColor: Colors.blue,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({
    super.key,
    required this.name,
    this.withTxtDecoration,
    this.myTextColor,
  });

  final String name;
  final TextDecoration? withTxtDecoration;
  final Color? myTextColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          color: (myTextColor != null) ? myTextColor : Colors.white,
          decoration: (withTxtDecoration != null)
              ? withTxtDecoration
              : TextDecoration.none,
          fontSize: ResponsiveValue(context,
              defaultValue: 16.0,
              conditionalValues: const [
                Condition.smallerThan(name: MOBILE, value: 16.0),
                Condition.largerThan(name: TABLET, value: 22.0)
              ]).value),
    );
  }
}
