import 'package:flutter/material.dart';

class SelfServiceTextformfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final bool obscureControll;
  final TextInputType? keyboardType;
  final String hintText;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? passwordToggle;
  
  const SelfServiceTextformfield({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.onFieldSubmitted, 
    this.passwordToggle, 
    this.obscureControll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            labelText: title,
            suffixIcon: obscureControll
                ? IconButton(
                    onPressed: passwordToggle,
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
