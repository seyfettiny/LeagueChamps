import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/passive_model.dart';
import 'package:leaguechamps/domain/entities/image.dart';
import 'package:leaguechamps/domain/entities/passive.dart';

void main() {
  final model = PassiveModel(
    name: 'name',
    description: 'description',
    image: Image(
      full: 'full',
      sprite: 'sprite',
      group: 'group',
      x: 0,
      y: 0,
      w: 0,
      h: 0,
    ),
  );
  test('should return toString method non-null', () {
    final result = model.toString();
    expect(result.length, greaterThan(0));
  });
  test('should print as String', () {
    final result = model.toString();
    expect(result, isA<String>());
  });
  test('should be subtype of Passive', () {
    expect(model, isA<Passive>());
  });
}
