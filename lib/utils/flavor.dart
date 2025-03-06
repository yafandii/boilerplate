enum Flavor {
  development,
  production,
}

extension FlavorExtension on Flavor {
  String get value {
    switch (this) {
      case Flavor.production:
        return 'prod';
      default:
        return 'dev';
    }
  }
}

class FlavorConfig {
  final String baseUrl;
  final Flavor flavor;

  factory FlavorConfig(Flavor flavor) {
    if (flavor == Flavor.production) {
      return FlavorConfig.prod();
    } else {
      return FlavorConfig.dev();
    }
  }

  const FlavorConfig._({
    required this.baseUrl,
    required this.flavor,
  });

  FlavorConfig.prod()
      : this._(
          baseUrl: 'https://base-url.com', //fake url
          flavor: Flavor.production,
        );

  FlavorConfig.dev()
      : this._(
          baseUrl: 'https://base-url.com', //fake url
          flavor: Flavor.development,
        );

  Map toJson() => {
        'baseUrl': baseUrl,
        'flavor': flavor,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
