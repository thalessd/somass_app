import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField(
      {this.disabled = false,
      this.obscureText = false,
      this.validator,
      this.labelText,
      this.icon,
      this.hintText,
      this.controller,
      this.readOnly = false,
      this.onTap,
      this.onSaved,
      this.onChanged,
      this.keyboardType,
      this.inputFormatters,
        this.initialValue,
      });

  final String labelText;
  final String Function(String) validator;
  final Icon icon;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final bool disabled;
  final bool readOnly;
  final Function onTap;
  final Function(String) onSaved;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      initialValue: initialValue,
      decoration: InputDecoration(
          hintText: this.hintText,
          filled: true,
          prefixIcon: this.icon,
          labelText: this.labelText),
      validator: this.validator,
      obscureText: this.obscureText,
      controller: controller,
      enabled: !disabled,
      onSaved: onSaved,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }
}
