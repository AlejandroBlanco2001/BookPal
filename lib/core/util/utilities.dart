

class Utilities {
  static getIdentifierName(String identifier) {
    if (identifier.contains('@')) {
      return 'email';
    }
    return 'id';
  }
}