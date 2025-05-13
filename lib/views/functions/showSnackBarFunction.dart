// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

void showSnackBar_Function(BuildContext context,{required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            text)));
  }