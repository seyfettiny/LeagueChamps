import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/level_tip_model.dart';
import 'package:leaguechamps/domain/entities/level_tip.dart';

void main() {
  final model = LeveltipModel(
    label: ['label'],
    effect: ['effect'],
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
}
