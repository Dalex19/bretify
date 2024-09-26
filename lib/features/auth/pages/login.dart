import 'package:bretify_mvp/features/auth/widgets/my_text_field.dart';
import 'package:bretify_mvp/features/auth/widgets/pass_text_field.dart';
import 'package:bretify_mvp/features/auth/widgets/with.dart';
import 'package:bretify_mvp/features/auth/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.changeToRegister});
  final VoidCallback changeToRegister;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TopBar(
          name: "Inicia Sesión",
          nameSubtitle: "No tienes cuenta",
          textButtonName: "Registrate",
          changeToLogin: changeToRegister,
        ),
        const SizedBox(height: 20),
        const LoginForm(),
        const SizedBox(height: 30),
        const With(btnName: "Ingresar", subTitle: "O ingresa con")
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 100,
      child: Form(
        key: _formKey,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: MyTextField(hintText: "Correo / Usuario")),
            SizedBox(height: 12),
            Expanded(child: PassTextField()),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
