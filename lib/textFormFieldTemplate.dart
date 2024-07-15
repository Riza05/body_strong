import 'package:flutter/material.dart';

class TextFormFieldTemplate {
  Container textFormField () => Container(
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withOpacity(0.2)
    ),
    child: TextFormField(
      style: const TextStyle(color: Colors.black),
      validator: (value) {
        if (value!.isEmpty) {
          return "Неверное имя";
        }
        return null;
      },
      decoration: InputDecoration(
          icon: const Icon(
              Icons.person,
              color: Color(0xFFFAFF00)
          ),
          border: InputBorder.none,
          hintText: "Дистанция",
          hintStyle: const TextStyle(color: Colors.black, fontSize: 18)
      ),
    ),
  );
}