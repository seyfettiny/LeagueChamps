import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/info_model.dart';
import 'package:leaguechamps/domain/entities/info.dart';

void main() {
  InfoModel model = InfoModel(
    attack: 8,
    defense: 4,
    magic: 3,
    difficulty: 4,
  );
  test('should return toString method non-null', () {
    final result = model.toString();
    expect(result.length, greaterThan(0));
  });
  test('should print as String', () {
    final result = model.toString();
    expect(result, isA<String>());
  });
  test('should be subtype of Info', () {
    expect(model, isA<Info>());
  });
  test('should have same hashcode', () {
    final mockModel = model;
    final result = InfoModel.fromJson(
        jsonDecode('{"attack":8,"defense":4,"magic":3,"difficulty":4}'));
    expect(mockModel.hashCode, result.hashCode);
  });
}
