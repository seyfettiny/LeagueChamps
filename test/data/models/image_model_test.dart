import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/image_model.dart';
import 'package:leaguechamps/domain/entities/image.dart';

void main() {
  final ImageModel model = ImageModel(
    full: 'full',
    sprite: 'sprite',
    group: 'group',
    x: 0,
    y: 0,
    w: 0,
    h: 0,
  );
  test('should return toString method non-null', () {
    final result = model.toString();
    expect(result.length, greaterThan(0));
  });
  test('should print as String', () {
    final result = model.toString();
    expect(result, isA<String>());
  });
  test('should be subtype of Image', () {
    expect(model, isA<Image>());
  });
  test('should have same hashcode', () {
    final mockModel = model;
    final result = ImageModel.fromJson(
        jsonDecode('{"full":"full","sprite":"sprite","group":"group","x":0,"y":0,"w":0,"h":0}'));
    expect(mockModel.hashCode, result.hashCode);
  });
}
