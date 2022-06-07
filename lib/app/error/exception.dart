class HttpRequestException implements Exception {}

class HiveException implements Exception {}

class EntityModelMapperException implements Exception {
  final String message;

  EntityModelMapperException({required this.message});
}

class RemoteServerException implements Exception {}

class LocalDatabaseException implements Exception {}
