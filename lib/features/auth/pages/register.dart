import 'package:bretify_mvp/features/auth/widgets/register_form.dart';
import 'package:bretify_mvp/features/auth/widgets/with.dart';

import 'package:bretify_mvp/features/auth/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key, required this.changeToLogin});
  final VoidCallback changeToLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TopBar(
          name: "Crea una cuenta",
          nameSubtitle: "Ya tienes una cuenta?",
          textButtonName: "Inicia sesión",
          changeToLogin: changeToLogin,
        ),
        const SizedBox(height: 20),
        const RegisterForm(),
        const SizedBox(height: 30),
        const With(btnName: "Crear Cuenta", subTitle: "O registrarte con")
      ],
    );
  }
}
