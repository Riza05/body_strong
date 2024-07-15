import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Uniti {
  static const String key = "IMAGE_KEY";

  static Future<void> saveImageToPreferences(String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<String?> getImageFromPreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String), fit: BoxFit.fill);
  }
}