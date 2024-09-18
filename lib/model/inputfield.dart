import 'package:app_restaurante/model/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final user = TextEditingController();
final password = TextEditingController();
List<String> errors = [];

List<TextFormField> inputField = [
  TextFormField(
    controller: user,
    validator: (value) {
      errors = ValidatePassword.validate(value ?? '');
      if (errors.isNotEmpty) {
        return errors.join('\n');
      }
      return null;
    },
    decoration: InputDecoration(
      prefixIcon: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Icon(CupertinoIcons.envelope),
      ),
      prefixIconColor: Colors.black,
      hintText: 'Enter your email',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  TextFormField(
    obscureText: true,
    controller: password,
    validator: (value) {
      errors = ValidatePassword.validate(value ?? '');
      if (errors.isNotEmpty) {
        return errors.join('\n');
      }
      return null;
    },
    decoration: InputDecoration(
      prefixIcon: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Icon(CupertinoIcons.padlock),
      ),
      prefixIconColor: Colors.black,
      suffixIcon: IconButton(
          onPressed: () {}, icon: const Icon(CupertinoIcons.eye_slash)),
          suffixIconColor: Colors.black,
      hintText: 'Enter your password',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
];
