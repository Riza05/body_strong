import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

/// Класс для отрисовки кластеров на карте
class ClusterIconPainter {
  const ClusterIconPainter(this.clusterSize);

  /// Количество маркеров в кластере
  final int clusterSize;

  /// Метод, который отрисовывает фигуру кластера (фон и обводка)
  Canvas paintCirclePlacemark({
    required Size size,
    required PictureRecorder recorder,
  }) {
    final canvas = Canvas(recorder);


    final radius = size.height * 0;


    // внутренний круг - закрашенная часть маркера
    final fillPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;


    // внешний круг - обводка маркера
    final strokePaint = Paint()
      ..color = Colors.deepOrangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;


    final circleOffset = Offset(size.height / 2, size.width / 2);


    canvas
      ..drawCircle(circleOffset, radius, fillPaint)
      ..drawCircle(circleOffset, radius, strokePaint);
    return canvas;
  }

  /// Метод, который формирует фигуру кластера
  /// и преобразует ее в байтовый формат
  Future<Uint8List> getClusterIconBytes() async {
    const size = Size(150, 150);
    final recorder = PictureRecorder();

    // преобразование в байтовый формат
    final image = await recorder.endRecording().toImage(
      size.width.toInt(),
      size.height.toInt(),
    );
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);


    return pngBytes!.buffer.asUint8List();
  }
}