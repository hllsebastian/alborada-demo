enum Environment { dev, stg, prod }

class FlavorConfig {
  final Environment environment;
  final String baseUrl;

  static late FlavorConfig instance;

  FlavorConfig({required this.environment, required this.baseUrl});

  static void initialize(Environment env) {
    switch (env) {
      case Environment.dev:
        instance = FlavorConfig(
          environment: Environment.dev,
          baseUrl: "https://api.dev.example.com",
        );
        break;
      case Environment.stg:
        instance = FlavorConfig(
          environment: Environment.stg,
          baseUrl: "https://api.stg.example.com",
        );
        break;
      case Environment.prod:
        instance = FlavorConfig(
          environment: Environment.prod,
          baseUrl: "https://api.example.com",
        );
        break;
    }
  }
}
