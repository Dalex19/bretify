import 'package:bretify_mvp/features/auth/widgets/my_text_field.dart';
import 'package:bretify_mvp/features/auth/widgets/pass_text_field.dart';
import 'package:bretify_mvp/features/auth/widgets/term_&_conditions.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 260,
      child: Form(
        key: _formKey,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child: MyTextField(hintText: "Nombre")),
                SizedBox(width: 12),
                Expanded(child: MyTextField(hintText: "Apellido")),
              ],
            ),
            SizedBox(height: 12),
            Expanded(child: MyTextField(hintText: "Correo")),
            SizedBox(height: 12),
            Expanded(child: PassTextField()),
            SizedBox(height: 12),
            Expanded(child: MyTextField(hintText: "Cédula")),
            TermsConditions(),
          ],
        ),
      ),
    );
  }
}
