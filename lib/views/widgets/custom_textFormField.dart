import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String labelText, hintText;
  bool suffixIcon;
  Function(String) onChanged;
  bool obscureText;
  final TextEditingController? controller;
  CustomTextFormField(
      {required this.labelText,
      required this.hintText,
      required this.onChanged,
      required this.obscureText,
      this.controller,
      this.suffixIcon=false,
      super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: widget.controller,
      obscureText: _obscureText,
      style: const TextStyle(color: Colors.white),
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
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
         suffixIcon: widget.suffixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
    );
  }
}
