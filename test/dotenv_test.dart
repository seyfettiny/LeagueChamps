import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    print(Directory.current.toString());
    dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());
  });
  test('able to load .env', () {
    expect(dotenv.env['API_KEY'], 'watch?v=dQw4w9WgXcQ');
  });
}
