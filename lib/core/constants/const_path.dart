class ConstPath {
  ConstPath._();

  static String get baseUrl => 'https://fakestoreapi.com/';
  static String get products => 'products';
  static String findByAlias(String aliasId) => 'alias/$aliasId';
  }
