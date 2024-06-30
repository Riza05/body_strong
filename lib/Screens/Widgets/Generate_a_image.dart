import 'dart:math';

import 'package:flutter/material.dart';

class Generate_a_image {
  Random random = Random();

  List<String> textMotivationList = [
    "assets/image/30-year-old man with big muscles.jpg",
    "assets/image/_Inner and Outer Strength Man Testing the Limits o.jpg",
    "assets/image/a female athlete with a tanned.jpg",
    "assets/image/a female athlete with a tanned (1).jpg",
    "assets/image/a female athlete with a tanned (2).jpg",
    "assets/image/a female athlete with a tanned (3).jpg",
    "assets/image/a female athlete with a tanned (4).jpg",
    "assets/image/a female athlete with a tanned (5).jpg",
    "assets/image/a female athlete with a tanned (6).jpg",
    "assets/image/a female athlete with a tanned (7).jpg",
    "assets/image/a female athlete with a tanned (8).jpg",
    "assets/image/a male athlete with a tanned.jpg",
    "assets/image/a male athlete with a tanned (1).jpg",
    "assets/image/a male athlete with a tanned (2).jpg",
    "assets/image/a male athlete with a tanned (3).jpg",
    "assets/image/a male athlete with a tanned (4).jpg",
    "assets/image/Fitness girl wears sport bra (1).jpg",
    "assets/image/Generate an image of a handsome.jpg",
    "assets/image/Generate an image of a handsome (1).jpg",
    "assets/image/Muscular sweaty heavyweight alpha men with broad a.jpg .jpg",
    "assets/image/photo of thin muscular woman.jpg",
    "assets/image/photo of thin muscular woman (1).jpg",
    "assets/image/portrait of a stunningly beautiful male fairy in s.jpg",
    "assets/image/real photo a female athlete with a tanned.jpg",
    "assets/image/real photo a female athlete with a tanned (1).jpg",
    "assets/image/real photo a male athlete with a tanned.jpg",
    "assets/image/real photo a male athlete with a tanned (1) (1).jpg",
    "assets/image/real photo a male athlete with a tanned (2).jpg",
    "assets/image/real photo a male athlete with a tanned (3).jpg",
    "assets/image/real photo a male athlete with a tanned (4) (4).jpg",
    "assets/image/real photo a male athlete with a tanned (5).jpg",
    "assets/image/real photo a male athlete with a tanned (7).jpg",
    "assets/image/Strong biceps.jpg",
    "assets/image/Two Muscular sweaty heavyweight alpha men with bro.jpg",
  ];

  /*AssetImage img() {
    int min = 0;
    int max = textMotivationList.length - 1;
    random = Random();
    int r = min + random!.nextInt(max - min);
    String imageName = textMotivationList[r].toString();
    return AssetImage(imageName);
  }*/

  String m() {
    int index = random.nextInt(textMotivationList.length);
    return textMotivationList[index];
  }

  Future<String> getFuture() {
    int index = random!.nextInt(textMotivationList.length);
    return Future.value(textMotivationList[index]
    );
  }
}