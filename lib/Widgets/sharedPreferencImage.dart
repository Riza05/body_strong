import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencImage {
  static const String IMG_KEY = "IMAGE_KEY";

  static Future<bool> saveImage(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(IMG_KEY, value);
  }

  static Future<String?> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(IMG_KEY);
  }

  static String base(Uint8List data) {
    return base64Encode(data as List<int>);
  }

  static Image imageFrom(String base64String) {
    return Image.memory(base64Decode(base64String), fit: BoxFit.fill,);
  }
}