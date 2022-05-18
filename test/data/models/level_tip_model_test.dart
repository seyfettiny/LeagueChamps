import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/level_tip_model.dart';
import 'package:leaguechamps/domain/entities/level_tip.dart';

void main() {
  final model = LeveltipModel(
    label: ["Hasar", "Bekleme Süresi"],
    effect: [
      "{{ basedamage }} -> {{ basedamageNL }}",
      "{{ cooldown }} -> {{ cooldownNL }}"
    ],
  );
  test('should return toString method non-null', () {
    final result = model.toString();
    expect(result.length, greaterThan(0));
  });
  test('should print as String', () {
    final result = model.toString();
    expect(result, isA<String>());
  });
  test('should be subtype of Leveltip', () {
    expect(model, isA<Leveltip>());
  });
  test('fields should be List<String>', () {
    expect(model.effect, isA<List<String>>());
    expect(model.label, isA<List<String>>());
  });
  test('should have same hashcode', () {
    final result = LeveltipModel.fromJson(jsonDecode(
        '{ "label": ["Hasar", "Bekleme Süresi"], "effect": ["{{ basedamage }} -> {{ basedamageNL }}", "{{ cooldown }} -> {{ cooldownNL }}"]}'));
    print(model.effect.hashCode);
    print(result.effect.hashCode);
    print(model.label.hashCode);
    print(result.label.hashCode);
    print(model.hashCode);
    print(result.hashCode);
    expect(model.hashCode, result.hashCode);
  });
}
