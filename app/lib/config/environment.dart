import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:yaml/yaml.dart';

@singleton
final class AppEnvironment {
  late final String name;
  late final String baseUrl;

  AppEnvironment();

  @PostConstruct(preResolve: true)
  Future<void> fromVariable() async {
    const variable = String.fromEnvironment('env');
    final stringYaml = await rootBundle.loadString(_getFile(variable));
    final json = loadYaml(stringYaml) as Map;

    baseUrl = json['baseUrl'];
    name = json['env'];
  }

  static String _getFile(String variable) {
    switch (variable.toUpperCase()) {
      case 'PROD':
        return '.env.prod.yaml';
      default:
        return '.env.dev.yaml';
    }
  }
}
