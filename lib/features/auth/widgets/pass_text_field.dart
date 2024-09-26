import 'package:flutter/material.dart';

class PassTextField extends StatefulWidget {
  const PassTextField({super.key});

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff3B364C),
          borderRadius: BorderRadius.circular(15)),
      height: 45,
      child: TextFormField(
        obscureText: isObscureText,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: isObscureText
                  ? const Icon(Icons.lock)
                  : const Icon(Icons.remove_red_eye)),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
          hintText: "Contraseña",
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade400, width: 2.0),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
