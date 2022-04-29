import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/skins_model.dart';
import 'package:leaguechamps/domain/entities/skins.dart';

void main() {
  final model = SkinsModel(
    id: 'id',
    name: 'name',
    num: 0,
    chromas: false,
  );
  test('should return toString method non-null', () {
    final result = model.toString();
    expect(result.length, greaterThan(0));
  });
  test('should print as String', () {
    final result = model.toString();
    expect(result, isA<String>());
  });
  test('should be subtype of Skins', () {
    expect(model, isA<Skins>());
  });
}
