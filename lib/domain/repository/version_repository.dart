import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lolwiki/app/constants.dart';

abstract class IVersionRepository {
  Future<String> getVersion();
}

class VersionRepository implements IVersionRepository {
  final http.Client _client = http.Client();
  @override
  Future<String> getVersion() async {
    final response = await _client.get(Uri.parse(AppConstants.versionsUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse[0];
    } else {
      throw Exception('Failed to load version');
    }
  }

  Future<List<dynamic>> getVersionList() async {
    final response = await _client.get(Uri.parse(AppConstants.versionsUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load version');
    }
  }
}
