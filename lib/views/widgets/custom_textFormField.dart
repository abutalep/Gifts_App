// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String labelText, hintText;
  bool suffixIcon;
  Function(String) onChanged;
  bool obscureText;
  int maxLines;
  InputBorder border;
  Color color;
  final TextEditingController? controller;
  CustomTextFormField(
      {required this.labelText,
      required this.hintText,
      required this.onChanged,
      required this.border,
       this.obscureText=false,
      this.controller,
      this.suffixIcon=false,
      this.maxLines=1,
      this.color=Colors.white,
      super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  late int maxLines;
  late InputBorder border;
  late Color color;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    maxLines=widget.maxLines;
    border=widget.border;
    color=widget.color;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: widget.controller,
      obscureText: _obscureText,
      style:  TextStyle(color:color),
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is required";
        } else {
          return null;
        }
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:  TextStyle(
          color: color,
        ),
        hintText: widget.hintText,
        hintStyle:  TextStyle(
          color: color,
        ),
        enabledBorder: border,
        border: border,
        focusedBorder:border,
         suffixIcon: widget.suffixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: color,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
    );
  }
}
