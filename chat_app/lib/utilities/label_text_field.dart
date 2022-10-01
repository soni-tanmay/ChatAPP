import 'package:flutter/material.dart';

import 'export.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.validator,
    this.isObsecure = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelText,
          style: const TextStyle(
            color: AppTheme.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: isObsecure,
          cursorColor: AppTheme.black,
          cursorHeight: 18,
          cursorWidth: 1.5,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: Icon(
              prefixIcon,
              color: AppTheme.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppTheme.lightGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppTheme.black.withOpacity(0.7),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppTheme.lightGrey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppTheme.red.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
