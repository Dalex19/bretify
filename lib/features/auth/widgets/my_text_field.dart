import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff3B364C),
          borderRadius: BorderRadius.circular(15)),
      height: 45,
      child: TextFormField(
        style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
          hintText: hintText,
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
