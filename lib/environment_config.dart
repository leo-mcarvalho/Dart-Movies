import 'package:riverpod/riverpod.dart';

class EnvironmentConfig {
  final movieApiKey = const String.fromEnvironment("movieApiKey");
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
