import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            value: false,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            }),
        RichText(
          text: TextSpan(
            text: 'Acepto los ',
            style: const TextStyle(fontSize: 16, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: 'terminos & condiciones',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: Colors.purple.shade200),
              ),
            ],
          ),
        )
      ],
    );
  }
}
