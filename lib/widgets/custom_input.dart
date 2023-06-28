

import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final IconData icon;
  final String hint;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
    super.key, 
    required this.icon, 
    required this.hint, 
    required this.textController, 
    this.keyboardType  = TextInputType.emailAddress, 
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only( top: 5, left: 5, bottom: 5, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 5
                )
              ]
             ),
            child: TextField(
              controller: textController,
              autocorrect: false,
              keyboardType: keyboardType,
              obscureText: isPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hint
              ),
            ),
          );
  }
}