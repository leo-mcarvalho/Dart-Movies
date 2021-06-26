import 'package:riverpod/riverpod.dart';

class EnvironmentConfig {
  final movieApiKey =
      const String.fromEnvironment("ae884f3a647dcb51820850d70c0f3681");
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
