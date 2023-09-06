// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obsecureText;
  final String? Function(String?)? validator;

  const PrimaryTextField(
      {super.key,
      required this.controller,
      this.obsecureText = false,
      this.validator,
      required this.hintText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: labelText,
        labelText: labelText,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onpressed;
  const PrimaryButton({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 10),
        onPressed: onpressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}

class LinkButton extends StatelessWidget {
  final String text;
  final Function()? onpressed;
  const LinkButton({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(text),
    );
  }
}

class SizeBox extends StatelessWidget {
  const SizeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
    );
  }
}
