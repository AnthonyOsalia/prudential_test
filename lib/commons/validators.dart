import 'package:flutter/material.dart';
import 'package:prudential_test/utils/util.dart';

class Validators {
  static dynamic required_validator = (value) {
    if (value == null) {
      return 'This field is required';
    }

    try {
      if (value.isEmpty) {
        return 'This field is required';
      }
    } catch (_) {}
    return null;
  };

  static dynamic phoneValidator = (value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  };

  static String INVALID_PHONE_NUMBER = "Phone number is not valid";

  static String INVALID_EMAIL = "Please enter a valid email address";
}
