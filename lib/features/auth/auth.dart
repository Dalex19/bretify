import 'package:bretify_mvp/features/auth/pages/login.dart';
import 'package:bretify_mvp/features/auth/pages/register.dart';
import 'package:bretify_mvp/features/auth/widgets/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool changeView = true;
  @override
  Widget build(BuildContext context) {
    final Size finalSize = MediaQuery.of(context).size;

    void changeViewTo() {
      setState(() {
        changeView = !changeView;
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xff5E5870),
      body: SafeArea(
        child: SizedBox(
          height: finalSize.height,
          width: finalSize.width,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff2B2738),
                  borderRadius: BorderRadius.circular(ResponsiveValue(context,
                      defaultValue: 0.0,
                      conditionalValues: [
                        const Condition.largerThan(name: MOBILE, value: 0.0),
                        const Condition.largerThan(name: TABLET, value: 15.0)
                      ]).value)),
              height: ResponsiveValue(context,
                  defaultValue: finalSize.height,
                  conditionalValues: [
                    Condition.smallerThan(
                        name: MOBILE, value: finalSize.height),
                    Condition.largerThan(
                        name: TABLET, value: finalSize.height * 0.9)
                  ]).value,
              width: ResponsiveValue(context,
                  defaultValue: finalSize.width,
                  conditionalValues: [
                    Condition.smallerThan(name: MOBILE, value: finalSize.width),
                    Condition.largerThan(
                        name: TABLET, value: finalSize.width * 0.8)
                  ]).value,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveValue(context,
                              defaultValue: 0.0,
                              conditionalValues: [
                            const Condition.largerThan(
                                name: TABLET, value: 60.0)
                          ]).value),
                      child: (changeView)
                          ? Register(changeToLogin: () => changeViewTo())
                          : Login(changeToRegister: () => changeViewTo()),
                    ),
                  ),
                  const Onboarding()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//5E5870